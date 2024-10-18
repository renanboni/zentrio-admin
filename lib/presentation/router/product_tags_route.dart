import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:zentrio_admin/domain/models/product_type.dart';

import '../components/dialog_page.dart';
import '../components/sheet_page.dart';
import '../features/productTag/product_tag_page.dart';
import '../features/productTags/product_tags_page.dart';
import '../features/productType/edit/edit_product_type_page.dart';
import '../features/productType/product_type_page.dart';
import '../features/productTypes/create/create_product_type_page.dart';
import '../features/productTypes/product_types_page.dart';
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
          builder: (_) => const CreateProductTypePage(),
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
              final productType = state.extra as ProductType;
              return SheetPage(
                builder: (_) => EditProductTypePage(
                  productType: productType,
                ),
              );
            },
          ),
        ]),
  ],
);
