import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:tuple/tuple.dart';
import 'package:zentrio_admin/domain/models/vendor.dart';

import '../../../components/edit_context_menu.dart';
import '../../../components/key_value_item_list.dart';

class VendorDetailsCard extends StatelessWidget {
  final Vendor vendor;

  const VendorDetailsCard({
    super.key,
    required this.vendor,
  });

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          _buildHeader(context, vendor),
          const Divider(height: 1),
          KeyValueItemList(pair: Tuple2("ID", vendor.id)),
          const Divider(height: 1),
          KeyValueItemList(pair: Tuple2("Name", vendor.name)),
          const Divider(height: 1),
          KeyValueItemList(pair: Tuple2("Handle", vendor.handle)),
          const Divider(height: 1),
        ],
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context,
    Vendor vendor,
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
            vendor.name,
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
