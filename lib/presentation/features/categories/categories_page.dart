import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/di/init.dart';
import 'package:zentrio_admin/presentation/components/card_scaffold.dart';
import 'package:zentrio_admin/presentation/features/categories/categories_view_model.dart';
import 'package:zentrio_admin/utils/extensions/context_ext.dart';

import '../../components/data_table_view.dart';
import '../../components/edit_context_menu.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({
    super.key,
  });

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final CategoriesViewModel viewModel = getIt<CategoriesViewModel>();

  @override
  Widget build(BuildContext context) {
    return CardScaffold(
      title: "Categories",
      subtitle:
          "Organize products into categories, and manage those categories' ranking and hierarchy.",
      trailing: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ShadButton(
              size: ShadButtonSize.sm,
              child: const Text('Edit ranking'),
              onPressed: () => GoRouter.of(context).go("/categories/organize"),
            ),
            const SizedBox(width: 8),
            ShadButton(
              size: ShadButtonSize.sm,
              child: const Text('Create'),
              onPressed: () async {
                final result = await GoRouter.of(context).push("/categories/create");
                if (result == true) {
                  viewModel.refresh();
                }
              },
            )
          ],
        ),
      ),
      child: Column(
        children: [
          const Divider(height: 1),
          Watch(
            (_) => Expanded(
              child: DataTableView(
                onRowTap: (category) {
                  GoRouter.of(context).go("/categories/${category.id}");
                },
                columns: const [
                  "Name",
                  "Description",
                  "Handle",
                  "Status",
                  "Visibility",
                  "",
                ],
                data: viewModel.categories.value.data,
                cellBuilder: (category) => [
                  DataCell(Text(category.name)),
                  DataCell(Text(category.description)),
                  DataCell(Text(category.handle)),
                  DataCell(
                    Text(category.isActive ? "Active" : "Inactive"),
                  ),
                  DataCell(
                    Text(category.isInternal ? "Internal" : "Public"),
                  ),
                  DataCell(
                    Align(
                      alignment: Alignment.centerRight,
                      child: EditContextMenu(
                        deleteDialogTitle: "Are you sure?",
                        deleteDialogDescription:
                            "You are about to delete the category ${category.name}. This action cannot be undone.",
                        onEdit: () => {
                          GoRouter.of(context).go("/categories/${category.id}/edit")
                        },
                        onDelete: () => {
                          viewModel.deleteCategory(category, () {
                            context.success("Category deleted successfully");
                            GoRouter.of(context).pop();
                          }, () {
                            context.error("Failed to delete category");
                          })
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
