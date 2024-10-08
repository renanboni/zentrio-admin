import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/domain/repositories/preferences_repository.dart';
import 'package:zentrio_admin/presentation/features/dashboard/side_bar_controller.dart';

import '../../../di/init.dart';
import '../../components/dark_mode_toggle.dart';
import '../../components/sidebar/models/side_bar_item.dart';
import '../../components/sidebar/side_bar.dart';
import '../../components/sidebar/side_bar_item_list.dart';

class DashboardMobilePage extends StatelessWidget {
  final DashboardViewModel controller;
  final Widget child;

  const DashboardMobilePage({
    super.key,
    required this.controller,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: DarkModeToggle(
              preferencesRepository: getIt<PreferencesRepository>(),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        child: Builder(builder: (context) {
          return SideBar(
            vendor: controller.vendor.watch(context),
            items: controller.menu.watch(context),
            onTap: (item) {
              Scaffold.of(context).closeDrawer();
              controller.onTap(item);
              GoRouter.of(context).go(item.route);
            },
            footer: const SideBarItem(
              label: "Sign out",
              icon: LucideIcons.logOut,
              type: SideBarItemType.button,
            ),
          );
        }),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: child,
      ),
    );
  }
}
