

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../components/dialog_page.dart';
import '../features/productTypes/create/create_product_type_page.dart';
import '../features/productTypes/product_types_page.dart';
import 'app_router.dart';

final productTypesRoute =   GoRoute(
  path: "/product_types",
  builder: (BuildContext context, GoRouterState state) {
    return const ProductTypesPage();
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
  ],
);