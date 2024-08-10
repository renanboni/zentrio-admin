import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/presentation/components/sidebar/models/side_bar_item.dart';
import 'package:zentrio_admin/presentation/components/sidebar/side_bar.dart';

import '../../components/topbar/topbar.dart';

class DashboardPage extends StatelessWidget {
  final Widget child;

  const DashboardPage({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 300,
          child: SideBar(
            items: [
              SideBarItem(
                label: "Vendors",
                icon: LucideIcons.store,
              ),
              SideBarItem(
                label: "Users",
                icon: LucideIcons.user,
              ),
            ],
            footer: SideBarItem(
              label: "Sign out",
              icon: LucideIcons.logOut,
            ),
          ),
        ),
        const VerticalDivider(width: 1),
        Expanded(
          child: Column(
            children: [
              const TopBar(),
              const Divider(height: 1,),
              Expanded(
                child: child,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
