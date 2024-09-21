import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../components/dialog_page.dart';
import '../features/product/product_page.dart';
import '../features/products/create/create_product_form.dart';
import '../features/products/products_page.dart';
import 'app_router.dart';

final productsRoute = GoRoute(
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
    GoRoute(
      path: ":id",
      builder: (BuildContext context, GoRouterState state) {
        final productId = state.pathParameters['id'];
        return ProductPage(
          productId: productId ?? '',
        );
      },
    ),
  ],
);