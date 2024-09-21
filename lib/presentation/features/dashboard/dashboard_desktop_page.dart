import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/presentation/features/dashboard/side_bar_controller.dart';

import '../../components/sidebar/models/side_bar_item.dart';
import '../../components/sidebar/side_bar.dart';
import '../../components/sidebar/side_bar_item_list.dart';
import '../../components/topbar/topbar.dart';

class DashboardDesktopPage extends StatelessWidget {
  final DashboardViewModel controller;
  final Widget child;

  const DashboardDesktopPage({
    super.key,
    required this.controller,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 250,
          child: SideBar(
            items: controller.menu.watch(context),
            vendor: controller.vendor.watch(context),
            onTap: (item) {
              controller.onTap(item);
              GoRouter.of(context).go(item.route);
            },
            footer: const SideBarItem(
              label: "Sign out",
              icon: LucideIcons.logOut,
              type: SideBarItemType.button,
            ),
          ),
        ),
        const VerticalDivider(width: 1),
        Expanded(
          child: Column(
            children: [
              const TopBar(),
              const Divider(
                height: 1,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: child,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
