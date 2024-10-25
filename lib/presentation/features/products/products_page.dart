import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/presentation/features/products/products_view_model.dart';
import 'package:zentrio_admin/utils/extensions/context_ext.dart';
import 'package:zentrio_admin/utils/extensions/localization_ext.dart';

import '../../../di/init.dart';
import '../../components/products_table.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final ProductsViewModel viewModel = getIt<ProductsViewModel>();

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ShadCard(
      padding: const EdgeInsets.all(0),
      title: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.loc.products,
              style: ShadTheme.of(context).textTheme.table,
            ),
            ShadButton(
              child: Text(context.loc.create),
              onPressed: () {
                GoRouter.of(context).go("/products/create");
              },
            )
          ],
        ),
      ),
      child: Expanded(
        child: Column(
          children: [
            const Divider(height: 1),
            Watch(
              (_) => Expanded(
                child: ProductsTable(
                  products: viewModel.products.value.data,
                  onDelete: (product) {
                    viewModel.onDeleteProduct(product.id, () {
                      context.success("Product deleted successfully");
                      GoRouter.of(context).pop();
                    }, () {
                      context.error("Failed to delete product");
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
