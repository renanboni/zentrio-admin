import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:tuple/tuple.dart';
import 'package:zentrio_admin/domain/models/category.dart';

import '../../../components/edit_context_menu.dart';
import '../../../components/key_value_item_list.dart';

class CategoryOrganizeCard extends StatelessWidget {
  final Category category;

  const CategoryOrganizeCard({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      padding: const EdgeInsets.all(0),
      child: Column(
        children: [
          _buildHeader(context, category),
          const Divider(height: 1),
          const KeyValueItemList(pair: Tuple2("Path", "test")),
          const Divider(height: 1),
          const KeyValueItemList(pair: Tuple2("Children", "")),
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
            "Organize",
            style: theme.textTheme.table,
          ),
          const Spacer(),
          EditContextMenu(
            onEdit: () {
              GoRouter.of(context).go("/categories/${category.id}/organize");
            },
          ),
        ],
      ),
    );
  }
}
