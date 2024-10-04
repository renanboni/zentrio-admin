import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:tuple/tuple.dart';
import 'package:zentrio_admin/domain/models/product.dart';
import 'package:zentrio_admin/presentation/components/key_value_item_list.dart';

import '../../../components/edit_context_menu.dart';

class ProductOrganizeCard extends StatelessWidget {
  final Product product;
  final VoidCallback onRefresh;

  const ProductOrganizeCard({
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
          const KeyValueItemList(pair: Tuple2("Tags", "")),
          const Divider(height: 1),
          const KeyValueItemList(pair: Tuple2("Type", "")),
          const Divider(height: 1),
          KeyValueItemList(
            pair: const Tuple2("Collection", null),
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: ShadBadge.secondary(
                  child: Text(product.collection.title),
                  onPressed: () => GoRouter.of(context).push(
                    "/collections/${product.collection.id}",
                  ),
                ),
              )
            ],
          ),
          const Divider(height: 1),
          KeyValueItemList(
            pair: const Tuple2(
              "Categories",
              "",
            ),
            children: product.categories
                .map(
                  (e) => MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: ShadBadge.secondary(
                      child: Text(e.name),
                      onPressed: () => GoRouter.of(context).push(
                        "/categories/${e.id}",
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
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
              final result = await GoRouter.of(context).push(
                "/products/${product.id}/organization",
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
