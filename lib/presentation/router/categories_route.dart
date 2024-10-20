import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:zentrio_admin/presentation/router/banners_route.dart';

import '../../di/init.dart';
import '../components/dialog_page.dart';
import '../components/sheet_page.dart';
import '../features/categories/categories_page.dart';
import '../features/categories/create/create_category_page.dart';
import '../features/categories/create/create_category_view_model.dart';
import '../features/category/category_page.dart';
import '../features/category/edit/category_edit_page.dart';
import '../features/category/edit/category_edit_view_model.dart';
import '../features/ranking/ranking_page.dart';
import '../features/ranking/ranking_view_model.dart';
import 'app_router.dart';

final categoriesRoute = GoRoute(
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
          builder: (_) => const CreateCategoryPage(),
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
      ],
    ),
  ],
);
