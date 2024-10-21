import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/domain/models/product_tag.dart';
import 'package:zentrio_admin/utils/extensions/string_ext.dart';

import '../../../components/edit_context_menu.dart';

final headings = ['Value', 'Created', 'Updated', ''];

class ProductTagsTable extends StatelessWidget {
  final List<ProductTag> productTags;
  final Function(ProductTag) onClick;
  final Function(ProductTag) onEdit;
  final Function(ProductTag) onDelete;

  const ProductTagsTable({
    super.key,
    required this.productTags,
    required this.onClick,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ShadTable(
      onRowTap: (index) => onClick(productTags[index - 1]),
      builder: (context, index) {
        final productTag = productTags[index.row];

        switch (index.column) {
          case 0:
            return ShadTableCell(child: Text(productTag.value));
          case 1:
            return ShadTableCell(child: Text(productTag.createdAt.yMMMd()));
          case 2:
            return ShadTableCell(child: Text(productTag.updatedAt.yMMMd()));
          default:
            return ShadTableCell(
              alignment: Alignment.centerRight,
              child: EditContextMenu(
                deleteDialogTitle: "Are you sure?",
                deleteDialogDescription:
                    "You are about to delete the product type ${productTag.value}. This action cannot be undone.",
                onEdit: () => {
                  onEdit(productTag),
                },
                onDelete: () => {
                  onDelete(productTag),
                },
              ),
            );
        }
      },
      columnCount: headings.length,
      rowCount: productTags.length,
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
