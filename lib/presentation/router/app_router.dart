import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zentrio_admin/di/init.dart';
import 'package:zentrio_admin/presentation/components/dialog_page.dart';
import 'package:zentrio_admin/presentation/features/categories/categories_page.dart';
import 'package:zentrio_admin/presentation/features/categories/create/create_category_page.dart';
import 'package:zentrio_admin/presentation/features/category/category_page.dart';
import 'package:zentrio_admin/presentation/features/category/edit/category_edit_page.dart';
import 'package:zentrio_admin/presentation/features/dashboard/dashboard_page.dart';
import 'package:zentrio_admin/presentation/features/dashboard/vendor/vendors_page.dart';
import 'package:zentrio_admin/presentation/features/ranking/ranking_page.dart';

import '../components/sheet_page.dart';
import '../features/categories/create/create_category_view_model.dart';
import '../features/category/edit/category_edit_view_model.dart';
import '../features/dashboard/side_bar_controller.dart';
import '../features/dashboard/vendor/vendors_controller.dart';
import '../features/invite/vendor_invite_page.dart';
import '../features/login/login_page.dart';
import '../features/products/create/create_product_form.dart';
import '../features/products/create/create_product_viewmodel.dart';
import '../features/products/products_page.dart';
import '../features/products/products_view_model.dart';
import '../features/ranking/ranking_view_model.dart';

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
        GoRoute(
          path: "/vendors",
          builder: (BuildContext context, GoRouterState state) {
            return VendorsPage(
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
          ],
        ),
        GoRoute(
          path: "/products",
          builder: (BuildContext context, GoRouterState state) {
            return const ProductsPage();
          },
          routes: [
            GoRoute(
              path: "create",
              parentNavigatorKey: rootNavigatorKey,
              pageBuilder: (BuildContext context, GoRouterState state) {
                return DialogPage(
                  builder: (_) => const CreateProductForm(),
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: "/categories",
          builder: (BuildContext context, GoRouterState state) {
            return const CategoriesPage();
          },
          routes: [
            GoRoute(
              path: "create",
              parentNavigatorKey: rootNavigatorKey,
              pageBuilder: (BuildContext context, GoRouterState state) {
                return DialogPage(
                  builder: (_) => CreateCategoryPage(
                    viewModel: getIt<CreateCategoryViewModel>(),
                  ),
                );
              },
            ),
            GoRoute(
              path: "organize",
              parentNavigatorKey: rootNavigatorKey,
              pageBuilder: (BuildContext context, GoRouterState state) {
                return DialogPage(
                  builder: (_) => RankingPage(
                    viewModel: getIt<RankingViewModel>(),
                  ),
                );
              },
            ),
            GoRoute(
              path: ':id',
              builder: (BuildContext context, GoRouterState state) {
                final categoryId = state.pathParameters['id'];
                return CategoryPage(
                  categoryId: categoryId ?? '',
                );
              },
              routes: [
                GoRoute(
                  path: "organize",
                  parentNavigatorKey: rootNavigatorKey,
                  pageBuilder: (BuildContext context, GoRouterState state) {
                    return DialogPage(
                      builder: (_) => RankingPage(
                        viewModel: getIt<RankingViewModel>(),
                      ),
                    );
                  },
                ),
                GoRoute(
                  path: "edit",
                  parentNavigatorKey: rootNavigatorKey,
                  pageBuilder: (BuildContext context, GoRouterState state) {
                    final categoryId = state.pathParameters['id'];
                    return SheetPage(
                      builder: (_) => CategoryEditPage(
                        categoryId: categoryId ?? '',
                        viewModel: getIt<CategoryEditViewModel>(),
                      ),
                    );
                  },
                ),
              ]
            ),
          ],
        ),
      ],
    )
  ],
  initialLocation: '/login',
  navigatorKey: rootNavigatorKey,
);
