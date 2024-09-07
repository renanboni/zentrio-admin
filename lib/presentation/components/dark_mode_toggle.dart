import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/domain/repositories/preferences_repository.dart';

class DarkModeToggle extends StatelessWidget {
  final PreferencesRepository preferencesRepository;

  const DarkModeToggle({
    super.key,
    required this.preferencesRepository,
  });

  @override
  Widget build(BuildContext context) {
    return Watch((_) {
        return ShadButton.outline(
        size: ShadButtonSize.sm,
        onPressed: () {
          final newThemeMode = preferencesRepository.theme().value == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
          preferencesRepository.saveTheme(newThemeMode);
        },
        icon: Icon(
          preferencesRepository.theme().value == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode,
          size: 16,
        ),
      );
    });
  }
}
