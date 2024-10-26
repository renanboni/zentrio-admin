import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/domain/models/product.dart';
import 'package:zentrio_admin/domain/models/sales_channel.dart';
import 'package:zentrio_admin/presentation/components/card_scaffold.dart';
import 'package:zentrio_admin/presentation/components/edit_context_menu.dart';
import 'package:zentrio_admin/utils/extensions/localization_ext.dart';
import 'package:zentrio_admin/utils/extensions/sizes_ext.dart';

class ProductSalesChannels extends StatelessWidget {
  final Product product;
  final List<SalesChannel> salesChannels;

  const ProductSalesChannels({
    super.key,
    required this.product,
    required this.salesChannels,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return CardScaffold(
      title: context.loc.salesChannel,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      trailing: EditContextMenu(onEdit: () {}),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SizedBox(width: 16),
              Container(
                padding: 2.paddingAll(),
                decoration: BoxDecoration(
                  color: theme.colorScheme.background,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: theme.colorScheme.border,
                  ),
                ),
                child: Icon(
                  size: 16,
                  LucideIcons.gitFork,
                  color: theme.colorScheme.ring,
                ),
              ),
              const SizedBox(width: 8),
              if (product.salesChannels.isEmpty)
                Text(
                  context.loc.notAvailableInChannelSales,
                  style: theme.textTheme.muted,
                )
              else
                Container(),
            ],
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Text(
              context.loc.availableInChannelSales(
                product.salesChannels.length,
                salesChannels.length,
              ),
              style: theme.textTheme.muted,
            ),
          ),
        ],
      ),
    );
  }
}
