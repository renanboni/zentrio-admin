import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/domain/models/product_type.dart';
import 'package:zentrio_admin/utils/extensions/string_ext.dart';

import '../../../components/edit_context_menu.dart';

final headings = ['Value', 'Created', 'Updated', ''];

class ProductTypesTable extends StatelessWidget {
  final List<ProductType> productTypes;
  final Function(ProductType) onClick;
  final Function(ProductType) onEdit;
  final Function(ProductType) onDelete;

  const ProductTypesTable({
    super.key,
    required this.productTypes,
    required this.onClick,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ShadTable(
      onRowTap: (index) => onClick(productTypes[index - 1]),
      builder: (context, index) {
        final productType = productTypes[index.row];

        switch (index.column) {
          case 0:
            return ShadTableCell(child: Text(productType.value));
          case 1:
            return ShadTableCell(child: Text(productType.createdAt.yMMMd()));
          case 2:
            return ShadTableCell(child: Text(productType.updatedAt.yMMMd()));
          default:
            return ShadTableCell(
              alignment: Alignment.centerRight,
              child: EditContextMenu(
                deleteDialogTitle: "Are you sure?",
                deleteDialogDescription:
                    "You are about to delete the product type ${productType.value}. This action cannot be undone.",
                onEdit: () => {
                  onEdit(productType),
                },
                onDelete: () => {
                  onDelete(productType),
                },
              ),
            );
        }
      },
      columnCount: headings.length,
      rowCount: productTypes.length,
      header: (context, column) {
        final isLast = column == headings.length - 1;
        return ShadTableCell.header(
          alignment: isLast ? Alignment.centerRight : null,
          child: Text(headings[column]),
        );
      },
      columnSpanExtent: (index) {
        if (index == 0) return const FixedTableSpanExtent(350);
        if (index == 1) return const FixedTableSpanExtent(350);
        if (index == 2) return const FixedTableSpanExtent(350);
        if (index == 3) {
          return const MaxTableSpanExtent(
            FixedTableSpanExtent(200),
            RemainingTableSpanExtent(),
          );
        }
        return null;
      },
    );
  }
}
