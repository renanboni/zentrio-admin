import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/domain/models/product.dart';
import 'package:zentrio_admin/presentation/components/context_menu.dart';
import 'package:zentrio_admin/presentation/features/product/components/product_options_list.dart';

const menu = [
  ContextMenuItem(
    id: "create",
    title: "Create",
    icon: LucideIcons.plus,
  ),
];

class ProductOptionsCard extends StatelessWidget {
  final Product product;

  const ProductOptionsCard({
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
          ProductOptionsList(options: product.options),
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
            "Options",
            style: theme.textTheme.table,
          ),
          const Spacer(),
          ContextMenu(
            items: menu,
            onClick: (item) {
              GoRouter.of(context).push(
                "/products/${product.id}/options/create",
              );
            },
          ),
        ],
      ),
    );
  }
}
