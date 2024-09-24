import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:tuple/tuple.dart';
import 'package:zentrio_admin/domain/models/api_key.dart';

import '../../../components/edit_context_menu.dart';
import '../../../components/key_value_item_list.dart';

class VendorApiKeyCard extends StatelessWidget {
  final ApiKey apiKey;

  const VendorApiKeyCard({
    super.key,
    required this.apiKey,
  });

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          _buildHeader(context),
          const Divider(height: 1),
          KeyValueItemList(pair: Tuple2(apiKey.title, apiKey.redacted)),
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
