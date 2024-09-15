import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/domain/models/category.dart';
import 'package:zentrio_admin/presentation/components/category/category_status.dart';
import 'package:zentrio_admin/presentation/components/category/category_visibility.dart';
import 'package:zentrio_admin/presentation/components/edit_context_menu.dart';

final headings = ['Name', 'Handle', 'Status', 'Visibility', ''];

class CategoriesTable extends StatelessWidget {
  final List<Category> categories;
  final ValueChanged<Category> onDelete;
  final ValueChanged<Category> onEdit;

  const CategoriesTable({
    super.key,
    required this.categories,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ShadTable(
      builder: (context, index) {
        final category = categories[index.row];

        switch (index.column) {
          case 0:
            return ShadTableCell(
              child: Text(
                category.name,
                style: theme.textTheme.muted,
              ),
            );
          case 1:
            return ShadTableCell(
              child: Text(
                category.handle,
                style: theme.textTheme.muted,
              ),
            );
          case 2:
            return ShadTableCell(
              child: CategoryStatus(isActive: category.isActive),
            );
          case 3:
            return ShadTableCell(
              child: CategoryVisibility(isInternal: category.isInternal),
            );
          case 4:
            return ShadTableCell(
              alignment: Alignment.centerRight,
              child: EditContextMenu(
                deleteDialogTitle: "Are you sure?",
                deleteDialogDescription:
                    "You are about to delete the category ${category.name}. This action cannot be undone.",
                onEdit: () => onEdit(category),
                onDelete: () => onDelete(category),
              ),
            );
          default:
            return const ShadTableCell(child: SizedBox());
        }
      },
      columnCount: headings.length,
      rowCount: categories.length,
      header: (context, column) {
        final isLast = column == headings.length - 1;
        return ShadTableCell.header(
          alignment: isLast ? Alignment.centerRight : null,
          child: Text(headings[column]),
        );
      },
      columnSpanExtent: (index) {
        if (index == 0) return const FixedTableSpanExtent(250);
        if (index == 1) return const FixedTableSpanExtent(250);
        if (index == 2) return const FixedTableSpanExtent(250);
        if (index == 3) return const FixedTableSpanExtent(250);
        if (index == 4) {
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
