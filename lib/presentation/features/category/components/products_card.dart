import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/domain/models/product.dart';
import 'package:zentrio_admin/presentation/features/products/components/products_table.dart';

import '../../../components/edit_context_menu.dart';

class ProductsCard extends StatelessWidget {
  final List<Product> products;

  const ProductsCard({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      padding: const EdgeInsets.all(0),
      child: Expanded(
        child: Column(
          children: [
            _buildHeader(context),
            const Divider(height: 1),
            if (products.isEmpty) _emptyProducts(context),
            if (products.isNotEmpty)
              Expanded(
                child: ProductsTable(
                  products: products,
                  onClick: (product) {},
                ),
              )
          ],
        ),
      ),
    );
  }

  Widget _emptyProducts(
    BuildContext context,
  ) {
    final theme = ShadTheme.of(context);

    return Padding(
      padding: 128.paddingVertical(),
      child: Column(
        children: [
          const ShadImage(
            LucideIcons.circleAlert,
            width: 16,
            height: 16,
          ),
          const SizedBox(height: 12),
          Text(
            "No records",
            style: theme.textTheme.small,
          ),
          const SizedBox(height: 4),
          Text(
            "There are no products in the category.",
            style: theme.textTheme.muted,
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context,
  ) {
    final theme = ShadTheme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(
        children: [
          Text(
            "Products",
            style: theme.textTheme.table,
          ),
          const Spacer(),
          EditContextMenu(
            onEdit: () {},
          ),
        ],
      ),
    );
  }
}
