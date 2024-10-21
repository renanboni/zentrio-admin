import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:zentrio_admin/domain/models/product.dart';
import 'package:zentrio_admin/presentation/features/product/edit/product_edit_page.dart';
import 'package:zentrio_admin/presentation/features/product/organization/product_organization_page.dart';

import '../components/dialog_page.dart';
import '../components/sheet_page.dart';
import '../features/product/metadata/product_metadata_page.dart';
import '../features/product/options/create_product_option_page.dart';
import '../features/product/product_page.dart';
import '../features/product/variants/create/product_create_variant_page.dart';
import '../features/productAttributes/product_attributes_page.dart';
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
      routes: [
        GoRoute(
          path: "attributes",
          parentNavigatorKey: rootNavigatorKey,
          pageBuilder: (BuildContext context, GoRouterState state) {
            final product = state.extra as Product;
            return SheetPage(
              builder: (_) => ProductAttributesPage(
                product: product,
              ),
            );
          },
        ),
        GoRoute(
          path: "edit",
          parentNavigatorKey: rootNavigatorKey,
          pageBuilder: (BuildContext context, GoRouterState state) {
            final product = state.extra as Product;
            return SheetPage(
              builder: (_) => ProductEditPage(
                product: product,
              ),
            );
          },
        ),
        GoRoute(
          path: "organization",
          parentNavigatorKey: rootNavigatorKey,
          pageBuilder: (BuildContext context, GoRouterState state) {
            final productId = state.pathParameters['id'];
            return SheetPage(
              builder: (_) => ProductOrganizationPage(
                productId: productId ?? '',
              ),
            );
          },
        ),
        GoRoute(
          path: "metadata/edit",
          parentNavigatorKey: rootNavigatorKey,
          pageBuilder: (BuildContext context, GoRouterState state) {
            final productId = state.pathParameters['id'];
            return SheetPage(
              builder: (_) => ProductMetadataPage(
                productId: productId ?? '',
              ),
            );
          },
        ),
        GoRoute(
          path: "options/create",
          parentNavigatorKey: rootNavigatorKey,
          pageBuilder: (BuildContext context, GoRouterState state) {
            final productId = state.pathParameters['id'];
            return SheetPage(
              builder: (_) => CreateProductOptionPage(
                productId: productId ?? '',
              ),
            );
          },
        ),
        GoRoute(
          path: "variants/create",
          parentNavigatorKey: rootNavigatorKey,
          pageBuilder: (BuildContext context, GoRouterState state) {
            final productId = state.pathParameters['id'];
            return DialogPage(
              builder: (_) => ProductCreateVariantPage(
                productId: productId ?? '',
              ),
            );
          },
        ),
      ],
    ),
  ],
);
