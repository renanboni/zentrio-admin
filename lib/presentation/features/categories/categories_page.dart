import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/presentation/features/categories/categories_view_model.dart';
import 'package:zentrio_admin/presentation/features/categories/components/category_table.dart';

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
            ShadButton(
              child: const Text('Create'),
              onPressed: () {

              },
            )
          ],
        ),
      ),
      child: Expanded(
        child: Column(
          children: [
            const Divider(height: 1),
            Expanded(
              child: CategoriesTable(categories: viewModel.categories.watch(context)),
            ),
          ],
        ),
      ),
    );
  }
}
