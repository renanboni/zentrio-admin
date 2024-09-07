import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/main.dart';
import 'package:zentrio_admin/presentation/features/products/products_view_model.dart';

import 'components/products_table.dart';

class ProductsPage extends StatelessWidget {
  final ProductsViewModel viewModel;

  const ProductsPage({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
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
              "Products",
              style: ShadTheme.of(context).textTheme.table,
            ),
            ShadButton(
              child: const Text('Create'),
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
            Expanded(
              child: ProductsTable(products: viewModel.products.watch(context)),
            ),
          ],
        ),
      ),
    );
  }
}
