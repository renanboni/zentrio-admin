import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/di/init.dart';
import 'package:zentrio_admin/domain/repositories/preferences_repository.dart';

import 'presentation/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  Intl.defaultLocale = 'pt_BR';
  await configureInjection();
  runApp(
    MyApp(
      preferencesRepository: getIt<PreferencesRepository>(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final PreferencesRepository preferencesRepository;

  const MyApp({
    super.key,
    required this.preferencesRepository,
  });

  @override
  Widget build(BuildContext context) {
    return ShadApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: Material(child: child),
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      themeMode: preferencesRepository.theme().watch(context),
      theme: ShadThemeData(
        brightness: Brightness.light,
        colorScheme: const ShadZincColorScheme.light(),
        disableSecondaryBorder: true,
      ),
      darkTheme: ShadThemeData(
        brightness: Brightness.dark,
        colorScheme: const ShadZincColorScheme.dark(),
        disableSecondaryBorder: true,
      ),
    );
  }
}
