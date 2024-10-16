import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/domain/models/product.dart';

import '../../../components/edit_context_menu.dart';

final headings = [
  'Product',
  'Collection',
  'Sales Channels',
  'Variants',
  'Status',
  ''
];

class ProductsTable extends StatelessWidget {
  final List<Product> products;
  final ValueChanged<Product> onClick;

  const ProductsTable({
    super.key,
    required this.products,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return ShadTable(
      onRowTap: (index) => onClick(products[index - 1]),
      builder: (context, index) {
        final product = products[index.row];

        switch (index.column) {
          case 0:
            return ShadTableCell(
              child: Row(
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
                  Text(product.title),
                ],
              ),
            );
          case 1:
            return ShadTableCell(child: Text(product.collection.title));
          case 2:
            return const ShadTableCell(child: Text("-"));
          case 3:
            return const ShadTableCell(child: Text("-"));
          case 4:
            return ShadTableCell(child: Text(product.status));
          default:
            return ShadTableCell(
              alignment: Alignment.centerRight,
              child: EditContextMenu(
                deleteDialogTitle: "Are you sure?",
                deleteDialogDescription:
                    "You are about to delete the product ${product.title}. This action cannot be undone.",
                onEdit: () => {},
                onDelete: () => {},
              ),
            );
        }
      },
      columnCount: headings.length,
      rowCount: products.length,
      header: (context, column) {
        final isLast = column == headings.length - 1;
        return ShadTableCell.header(
          alignment: isLast ? Alignment.centerRight : null,
          child: Text(headings[column]),
        );
      },
      columnSpanExtent: (index) {
        if (index == 0) return const FixedTableSpanExtent(250);
        if (index == 1) return const FixedTableSpanExtent(200);
        if (index == 2) return const FixedTableSpanExtent(250);
        if (index == 3) return const FixedTableSpanExtent(150);
        if (index == 4) return const FixedTableSpanExtent(250);
        if (index == 5) {
          return const MaxTableSpanExtent(
            FixedTableSpanExtent(120),
            RemainingTableSpanExtent(),
          );
        }
        return null;
      },
    );
  }
}
