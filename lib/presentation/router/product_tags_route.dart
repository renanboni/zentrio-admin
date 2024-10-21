import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:zentrio_admin/domain/models/product_tag.dart';

import '../components/dialog_page.dart';
import '../components/sheet_page.dart';
import '../features/productTag/create/create_product_tag_page.dart';
import '../features/productTag/edit/edit_product_tag_page.dart';
import '../features/productTag/product_tag_page.dart';
import '../features/productTags/product_tags_page.dart';
import 'app_router.dart';

final productTagsRoute = GoRoute(
  path: "/product_tags",
  builder: (BuildContext context, GoRouterState state) {
    return const ProductTagsPage();
  },
  routes: [
    GoRoute(
      path: "create",
      parentNavigatorKey: rootNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return DialogPage(
          builder: (_) => const CreateProductTagPage(),
        );
      },
    ),
    GoRoute(
      path: ":id",
      builder: (BuildContext context, GoRouterState state) {
        final productTagId = state.pathParameters['id'];
        return ProductTagPage(
          productTagId: productTagId ?? '',
        );
      },
      routes: [
        GoRoute(
          path: "edit",
          parentNavigatorKey: rootNavigatorKey,
          pageBuilder: (BuildContext context, GoRouterState state) {
            final productTag = state.extra as ProductTag;
            return SheetPage(
              builder: (_) => EditProductTagPage(
                productTag: productTag,
              ),
            );
          },
        ),
      ],
    ),
  ],
);
