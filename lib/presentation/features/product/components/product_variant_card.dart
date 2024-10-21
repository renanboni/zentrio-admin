import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/domain/models/product.dart';
import 'package:zentrio_admin/presentation/components/empty_list_placeholder.dart';

import '../../../components/context_menu.dart';

const menu = [
  ContextMenuItem(
    id: "create",
    title: "Create",
    icon: LucideIcons.plus,
  ),
  ContextMenuItem(
    id: "edit_prices",
    title: "Edit prices",
    icon: LucideIcons.pencilLine,
  ),
];

class ProductVariantCard extends StatelessWidget {
  final Product product;

  const ProductVariantCard({
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
          const EmptyListPlaceholder()
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
            "Variants",
            style: theme.textTheme.table,
          ),
          const Spacer(),
          ContextMenu(
            items: menu,
            onClick: (item) async {
              switch (item.id) {
                case "create":
                  final result = await GoRouter.of(context).push(
                    "/products/${product.id}/variants/create",
                  );
                  break;
                case "edit_prices":
                  break;
              }
            },
          ),
        ],
      ),
    );
  }
}
