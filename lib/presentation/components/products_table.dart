import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/domain/models/product.dart';
import 'package:zentrio_admin/utils/extensions/localization_ext.dart';

import 'data_table_view.dart';
import 'edit_context_menu.dart';

class ProductsTable extends StatelessWidget {
  final List<Product> products;
  final Function(Product) onDelete;

  const ProductsTable({
    super.key,
    required this.products,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return DataTableView(
      onRowTap: (product) {
        GoRouter.of(context).go("/products/${product.id}");
      },
      columns: [
        context.loc.product,
        context.loc.collection,
        context.loc.salesChannel,
        context.loc.variants,
        context.loc.status,
        ''
      ],
      data: products,
      cellBuilder: (product) => [
        DataCell(
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: ShadImage(
                  product.thumbnail,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  product.title,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.small.copyWith(fontSize: 12),
                ),
              ),
            ],
          ),
        ),
        DataCell(Text(
          product.collection.title,
          style: theme.textTheme.small.copyWith(fontSize: 12),
        )),
        DataCell(Text(
          product.salesChannels.map((e) => e.name).join(", "),
          style: theme.textTheme.small.copyWith(fontSize: 12),
        )),
        DataCell(Text(
          context.loc.nVariants(product.variants.length),
          style: theme.textTheme.small.copyWith(fontSize: 12),
        )),
        DataCell(Text(
          product.status,
          style: theme.textTheme.small.copyWith(fontSize: 12),
        )),
        DataCell(
          Align(
            alignment: Alignment.centerRight,
            child: EditContextMenu(
              deleteDialogTitle: context.loc.areYouSure,
              deleteDialogDescription:
                  "You are about to delete the product ${product.title}. This action cannot be undone.",
              onEdit: () =>
                  {GoRouter.of(context).go("/products/${product.id}/edit")},
              onDelete: () => {
                onDelete(product),
              },
            ),
          ),
        ),
      ],
    );
  }
}
