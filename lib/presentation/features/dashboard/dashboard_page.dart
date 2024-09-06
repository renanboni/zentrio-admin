import 'package:flutter/material.dart';
import 'package:zentrio_admin/presentation/features/dashboard/side_bar_controller.dart';

import '../../components/responsive/screen_type_layout.dart';
import 'dashboard_desktop_page.dart';
import 'dashboard_mobile_page.dart';

class DashboardPage extends StatelessWidget {
  final Widget child;
  final DashboardViewModel controller;

  const DashboardPage({
    super.key,
    required this.controller,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: DashboardMobilePage(controller: controller, child: child),
      desktop: DashboardDesktopPage(controller: controller, child: child),
      tablet: DashboardMobilePage(controller: controller, child: child),
    );
  }
}
