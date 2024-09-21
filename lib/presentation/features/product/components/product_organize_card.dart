import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:tuple/tuple.dart';
import 'package:zentrio_admin/domain/models/product.dart';
import 'package:zentrio_admin/presentation/components/key_value_item_list.dart';

import '../../../components/edit_context_menu.dart';

class ProductOrganizeCard extends StatelessWidget {
  final Product product;

  const ProductOrganizeCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          _buildHeader(context),
          const Divider(height: 1),
          const KeyValueItemList(pair: Tuple2("Tags", "")),
          const Divider(height: 1),
          const KeyValueItemList(pair: Tuple2("Type", "")),
          const Divider(height: 1),
          const KeyValueItemList(pair: Tuple2("Collection", "")),
          const Divider(height: 1),
          const KeyValueItemList(pair: Tuple2("Categories", "")),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
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
            onEdit: () async {

            },
          )
        ],
      ),
    );
  }
}
