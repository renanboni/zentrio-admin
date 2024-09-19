import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:tuple/tuple.dart';
import 'package:zentrio_admin/domain/models/category.dart';
import 'package:zentrio_admin/presentation/components/category/category_status.dart';
import 'package:zentrio_admin/presentation/components/category/category_visibility.dart';
import 'package:zentrio_admin/presentation/components/edit_context_menu.dart';
import 'package:zentrio_admin/presentation/components/key_value_item_list.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final VoidCallback? onRefresh;

  const CategoryCard({
    super.key,
    required this.category,
    this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      padding: const EdgeInsets.all(0),
      child: Column(
        children: [
          _buildHeader(context, category),
          const Divider(height: 1),
          KeyValueItemList(pair: Tuple2("Description", category.description)),
          const Divider(height: 1),
          KeyValueItemList(pair: Tuple2("Handle", category.handle)),
        ],
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context,
    Category category,
  ) {
    final theme = ShadTheme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(
        children: [
          Text(
            category.name,
            style: theme.textTheme.table,
          ),
          const Spacer(),
          Wrap(
            direction: Axis.horizontal,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 16,
            children: [
              CategoryStatus(isActive: category.isActive),
              CategoryVisibility(isInternal: category.isInternal),
              EditContextMenu(
                deleteDialogTitle: "Are you sure?",
                deleteDialogDescription:
                    "You are about to delete the category test. This action cannot be undone.",
                onEdit: () async {
                  final refresh = await GoRouter.of(context).push(
                    "/categories/${category.id}/edit",
                  );
                  if (refresh == true) {
                    onRefresh?.call();
                  }
                },
                onDelete: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}
