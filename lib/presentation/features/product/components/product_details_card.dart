import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:tuple/tuple.dart';
import 'package:zentrio_admin/domain/models/product.dart';
import 'package:zentrio_admin/presentation/components/item_status.dart';
import 'package:zentrio_admin/utils/extensions/localization_ext.dart';

import '../../../components/edit_context_menu.dart';
import '../../../components/key_value_item_list.dart';

class ProductDetailsCard extends StatelessWidget {
  final Product product;
  final VoidCallback onRefresh;

  const ProductDetailsCard({
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
          _buildHeader(context, product),
          const Divider(height: 1),
          KeyValueItemList(pair: Tuple2("Description", product.description)),
          const Divider(height: 1),
          KeyValueItemList(pair: Tuple2("Subtitle", product.subtitle)),
          const Divider(height: 1),
          KeyValueItemList(pair: Tuple2(context.loc.handle, product.handle)),
          const Divider(height: 1),
          KeyValueItemList(pair: Tuple2("Discountable", product.discountable)),
        ],
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context,
    Product product,
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
            product.title,
            style: theme.textTheme.table,
          ),
          const Spacer(),
          Wrap(
            direction: Axis.horizontal,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 16,
            children: [
              ItemStatus(isActive: product.status == "published", activeText: "published", inactiveText: "draft"),
              EditContextMenu(
                deleteDialogTitle: "Are you sure?",
                deleteDialogDescription:
                "You are about to delete the ${product.title}. This action cannot be undone.",
                onEdit: () async {
                  final result = await GoRouter.of(context).push(
                    "/products/${product.id}/edit",
                    extra: product,
                  );

                  if (result == true) {
                    onRefresh();
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
