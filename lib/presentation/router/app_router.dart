import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zentrio_admin/di/init.dart';
import 'package:zentrio_admin/presentation/components/dialog_page.dart';
import 'package:zentrio_admin/presentation/features/dashboard/dashboard_page.dart';
import 'package:zentrio_admin/presentation/features/dashboard/vendor/vendors_page.dart';

import '../features/dashboard/side_bar_controller.dart';
import '../features/dashboard/vendor/vendors_controller.dart';
import '../features/invite/vendor_invite_page.dart';
import '../features/login/login_page.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: "/login",
      builder: (BuildContext context, GoRouterState state) {
        return const LoginPage();
      },
    ),
    GoRoute(
      path: "/invite",
      builder: (BuildContext context, GoRouterState state) {
        return const VendorInvitePage();
      },
    ),
    ShellRoute(
      navigatorKey: shellNavigatorKey,
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return DashboardPage(
          controller: getIt<SideBarController>(),
          child: child,
        );
      },
      routes: [
        GoRoute(
            path: "/vendors",
            builder: (BuildContext context, GoRouterState state) {
              return  VendorsPage(
                controller: getIt<VendorsController>(),
              );
            },
            routes: [
              GoRoute(
                path: "create",
                parentNavigatorKey: rootNavigatorKey,
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return DialogPage(builder: (_) => const VendorInvitePage());
                },
              ),
            ]),
      ],
    )
  ],
  initialLocation: '/login',
  navigatorKey: rootNavigatorKey,
);
