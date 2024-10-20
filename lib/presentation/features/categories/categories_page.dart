import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/di/init.dart';
import 'package:zentrio_admin/presentation/components/card_scaffold.dart';
import 'package:zentrio_admin/presentation/features/categories/categories_view_model.dart';
import 'package:zentrio_admin/presentation/features/categories/components/category_table.dart';

import '../../../domain/models/category.dart';
import '../../components/data_table_view.dart';

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
              onPressed: () => GoRouter.of(context).go("/categories/create"),
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
                columns: const [
                  "Name",
                  "Description",
                  "Handle",
                  "Status",
                  "Visibility"
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
