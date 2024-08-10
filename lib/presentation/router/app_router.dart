import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zentrio_admin/presentation/components/dialog_page.dart';
import 'package:zentrio_admin/presentation/features/dashboard/dashboard_page.dart';
import 'package:zentrio_admin/presentation/features/dashboard/vendor/vendors_page.dart';

import '../features/dashboard/vendor/create/create_vendor_page.dart';
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
    ShellRoute(
      navigatorKey: shellNavigatorKey,
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return DashboardPage(child: child);
      },
      routes: [
        GoRoute(
          path: "/vendors",
          builder: (BuildContext context, GoRouterState state) {
            return const VendorsPage();
          },
          routes: [
            GoRoute(
              path: "create",
              parentNavigatorKey: rootNavigatorKey,
              pageBuilder: (BuildContext context, GoRouterState state) {
                return DialogPage(builder: (_) => const CreateVendorPage());
              },
            ),
          ]
        ),
      ],
    )
  ],
  initialLocation: '/login',
  navigatorKey: rootNavigatorKey,
);
