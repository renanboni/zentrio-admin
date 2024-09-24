import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:tuple/tuple.dart';

import '../../../components/edit_context_menu.dart';
import '../../../components/key_value_item_list.dart';

class VendorApiKeyCard extends StatelessWidget {
  const VendorApiKeyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          _buildHeader(context),
          const Divider(height: 1),
          const KeyValueItemList(pair: Tuple2("Api Key", "")),
        ],
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context,
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
            "Security",
            style: theme.textTheme.table,
          ),
          const Spacer(),
          EditContextMenu(
            deleteDialogTitle: "Are you sure?",
            deleteDialogDescription:
                "You are about to delete the category test. This action cannot be undone.",
            onEdit: () async {},
            onDelete: () {},
          )
        ],
      ),
    );
  }
}
