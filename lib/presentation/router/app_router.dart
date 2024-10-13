import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zentrio_admin/di/init.dart';
import 'package:zentrio_admin/presentation/features/dashboard/dashboard_page.dart';
import 'package:zentrio_admin/presentation/router/categories_route.dart';
import 'package:zentrio_admin/presentation/router/collections_route.dart';
import 'package:zentrio_admin/presentation/router/products_route.dart';
import 'package:zentrio_admin/presentation/router/vendors_route.dart';

import '../features/dashboard/side_bar_controller.dart';
import '../features/invite/vendor_invite_page.dart';
import '../features/login/login_page.dart';
import 'banners_route.dart';
import 'customers_route.dart';

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
      path: "/admin/login",
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
          controller: getIt<DashboardViewModel>(),
          child: child,
        );
      },
      routes: [
        vendorsRoute,
        productsRoute,
        categoriesRoute,
        collectionsRoute,
        bannersRoute,
        customerRoute,
      ],
    )
  ],
  initialLocation: '/login',
  navigatorKey: rootNavigatorKey,
);
