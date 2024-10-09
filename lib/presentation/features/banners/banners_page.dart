
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class BannersPage extends StatelessWidget {
  const BannersPage({super.key});

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
              "Banners",
              style: ShadTheme.of(context).textTheme.table,
            ),
            ShadButton(
              child: const Text('Create'),
              onPressed: () {
                GoRouter.of(context).go("/banners/create");
              },
            )
          ],
        ),
      ),
      child: Expanded(
        child: Column(
          children: [
            const Divider(height: 1),
           /* Expanded(
              child: ProductsTable(
                products: viewModel.products.watch(context),
                onClick: (product) async {
                  final result = await GoRouter.of(context).push(
                    "/products/${product.id}",
                  );

                  if (result != null) {
                    viewModel.refresh();
                  }
                },
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
