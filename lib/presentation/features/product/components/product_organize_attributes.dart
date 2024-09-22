import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:tuple/tuple.dart';
import 'package:zentrio_admin/domain/models/product.dart';
import 'package:zentrio_admin/presentation/components/key_value_item_list.dart';

import '../../../components/edit_context_menu.dart';

class ProductAttributesCard extends StatelessWidget {
  final Product product;
  final VoidCallback onRefresh;

  const ProductAttributesCard({
    super.key,
    required this.product,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          _buildHeader(context),
          const Divider(height: 1),
          KeyValueItemList(pair: Tuple2("Height", product.height)),
          const Divider(height: 1),
          KeyValueItemList(pair: Tuple2("Width", product.width)),
          const Divider(height: 1),
          KeyValueItemList(pair: Tuple2("Length", product.length)),
          const Divider(height: 1),
          KeyValueItemList(pair: Tuple2("Weight", product.weight)),
          const Divider(height: 1),
          KeyValueItemList(pair: Tuple2("MID", product.midCode)),
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
            "Attributes",
            style: theme.textTheme.table,
          ),
          const Spacer(),
          EditContextMenu(
            onEdit: () async {
              final result = await GoRouter.of(context).push(
                "/products/${product.id}/attributes",
                extra: product,
              );

              if (result == true) {
                onRefresh();
              }
            },
          )
        ],
      ),
    );
  }
}
