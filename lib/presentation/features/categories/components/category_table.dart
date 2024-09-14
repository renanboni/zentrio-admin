import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/domain/models/category.dart';
import 'package:zentrio_admin/presentation/components/edit_context_menu.dart';

final headings = ['Name', 'Handle', 'Status', 'Visibility', ''];

class CategoriesTable extends StatelessWidget {
  final List<Category> categories;

  const CategoriesTable({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return ShadTable(
      builder: (context, index) {
        final category = categories[index.row];

        switch (index.column) {
          case 0:
            return ShadTableCell(child: Text(category.name));
          case 1:
            return ShadTableCell(child: Text(category.handle));
          case 2:
            return ShadTableCell(child: _buildStatus(category.isActive));
          case 3:
            return ShadTableCell(child: _buildVisibility(category.isInternal));
          case 4:
            return ShadTableCell(
              alignment: Alignment.centerRight,
              child: EditContextMenu(
                deleteDialogTitle: "Are you sure?",
                deleteDialogDescription:
                    "You are about to delete the category ${category.name}. This action cannot be undone.",
                onEdit: () {},
                onDelete: () {},
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

  _buildStatus(bool isActive) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: isActive ? Colors.green : Colors.red,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 8),
        Text(isActive ? 'Active' : 'Inactive'),
      ],
    );
  }

  _buildVisibility(bool isInternal) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: isInternal ? Colors.green : Colors.red,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 8),
        Text(isInternal ? 'Public' : 'Internal'),
      ],
    );
  }
}