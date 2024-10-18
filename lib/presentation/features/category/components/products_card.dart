import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/domain/models/product.dart';
import 'package:zentrio_admin/presentation/components/empty_list_placeholder.dart';
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
            if (products.isEmpty) const EmptyListPlaceholder(),
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
