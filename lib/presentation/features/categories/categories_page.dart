import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/presentation/features/categories/categories_view_model.dart';
import 'package:zentrio_admin/presentation/features/categories/components/category_table.dart';

import '../../../domain/models/category.dart';

class CategoriesPage extends StatelessWidget {
  final CategoriesViewModel viewModel;

  const CategoriesPage({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      padding: const EdgeInsets.all(0),
      title: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Categories",
              style: ShadTheme.of(context).textTheme.table,
            ),
            const Spacer(),
            ShadButton(
              size: ShadButtonSize.sm,
              child: const Text('Edit ranking'),
              onPressed: () => GoRouter.of(context).go("/categories/organize"),
            ),
            const SizedBox(width: 8),
            ShadButton(
              size: ShadButtonSize.sm,
              child: const Text('Create'),
              onPressed: () => GoRouter.of(context).go("/categories/create"),
            )
          ],
        ),
      ),
      child: Expanded(
        child: Column(
          children: [
            const Divider(height: 1),
            Expanded(
              child: CategoriesTable(
                categories: viewModel.categories.watch(context),
                onEdit: (Category category) {
                  GoRouter.of(context).go("/categories/${category.id}");
                },
                onClick: (Category category) {
                  GoRouter.of(context).go("/categories/${category.id}");
                },
                onDelete: (Category value) async {
                  viewModel.deleteCategory(value, () {
                    ShadToaster.of(context).show(
                      ShadToast(
                        description: Text(
                          'Category ${value.name} deleted successfully',
                        ),
                      ),
                    );
                    GoRouter.of(context).pop();
                  }, () {
                    ShadToaster.of(context).show(
                      const ShadToast.destructive(
                        title: Text('Uh oh! Something went wrong'),
                        description:
                        Text('There was a problem with your request'),
                      ),
                    );
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
