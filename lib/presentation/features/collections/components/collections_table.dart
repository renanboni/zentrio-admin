import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/domain/models/collection.dart';

import '../../../components/edit_context_menu.dart';

final headings = [
  'Title',
  'Handle',
  'Products',
  '',
];

class CollectionsTable extends StatelessWidget {
  final List<Collection> collections;
  final ValueChanged<Collection> onClick;
  final ValueChanged<Collection> onEdit;
  final ValueChanged<Collection> onDelete;

  const CollectionsTable({
    super.key,
    required this.collections,
    required this.onClick,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ShadTable(
      onRowTap: (index) => onClick(collections[index - 1]),
      builder: (context, index) {
        final collection = collections[index.row];

        switch (index.column) {
          case 0:
            return ShadTableCell(
              child: Text(
                collection.title,
                style: theme.textTheme.muted,
              ),
            );
          case 1:
            return ShadTableCell(
              child: Text(
                collection.handle,
                style: theme.textTheme.muted,
              ),
            );
          case 2:
            return ShadTableCell(
              child: Text(
                "-",
                style: theme.textTheme.muted,
              ),
            );
          case 3:
            return ShadTableCell(
              alignment: Alignment.centerRight,
              child: EditContextMenu(
                deleteDialogTitle: "Are you sure?",
                deleteDialogDescription:
                "You are about to delete the category ${collection.title}. This action cannot be undone.",
                onEdit: () => onEdit(collection),
                onDelete: () => onDelete(collection),
              ),
            );
          default:
            return const ShadTableCell(child: SizedBox());
        }
      },
      columnCount: headings.length,
      rowCount: collections.length,
      header: (context, column) {
        final isLast = column == headings.length - 1;
        return ShadTableCell.header(
          alignment: isLast ? Alignment.centerRight : null,
          child: Text(headings[column]),
        );
      },
      columnSpanExtent: (index) {
        if (index == 0) return const FixedTableSpanExtent(300);
        if (index == 1) return const FixedTableSpanExtent(300);
        if (index == 2) return const FixedTableSpanExtent(300);
        if (index == 3) {
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
