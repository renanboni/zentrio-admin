import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/domain/models/sales_channel.dart';
import 'package:zentrio_admin/presentation/components/optional_label.dart';
import 'package:zentrio_admin/presentation/components/sales_channels_table.dart';

import '../../../../components/closable_chip.dart';

class SalesChannelsItemList extends StatelessWidget {
  final List<SalesChannel> salesChannels;
  final Function(SalesChannel) onRemove;
  final VoidCallback onAdd;

  const SalesChannelsItemList({
    super.key,
    required this.salesChannels,
    required this.onRemove,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Column(
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const OptionalLabel(label: "Sales channels"),
                Text(
                  "This product will only be available in the default sales channel if left untouched.",
                  style: theme.textTheme.muted,
                ),
              ],
            ),
            const Spacer(),
            ShadButton(
              size: ShadButtonSize.sm,
              onPressed: onAdd,
              child: const Text("Add"),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: salesChannels.map((salesChannel) {
            return ClosableChip(
              label: salesChannel.name,
              onClose: () {
                onRemove(salesChannel);
              },
            );
          }).toList()
        )
      ],
    );
  }
}

class SalesChannelsSheet extends StatelessWidget {
  final List<SalesChannel> salesChannels;

  const SalesChannelsSheet({super.key, required this.salesChannels});

  @override
  Widget build(BuildContext context) {
    return ShadSheet(
      constraints: const BoxConstraints(
        maxWidth: 512,
        minWidth: 512,
      ),
      child: Expanded(child: SalesChannelsTable(salesChannels: salesChannels)),
    );
  }
}
