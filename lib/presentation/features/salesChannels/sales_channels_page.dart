import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/di/init.dart';
import 'package:zentrio_admin/presentation/components/card_scaffold.dart';
import 'package:zentrio_admin/presentation/features/salesChannels/sales_channels_view_model.dart';

import '../../components/sales_channels_table.dart';

class SalesChannelsPage extends StatefulWidget {
  const SalesChannelsPage({super.key});

  @override
  State<SalesChannelsPage> createState() => _SalesChannelsPageState();
}

class _SalesChannelsPageState extends State<SalesChannelsPage> {
  final SalesChannelsViewModel viewModel = getIt<SalesChannelsViewModel>();

  @override
  Widget build(BuildContext context) {
    return CardScaffold(
      title: "Sales Channels",
      subtitle: "Manage the online and offline channels you sell products on.",
      trailing: const ShadButton(
        size: ShadButtonSize.sm,
        child: Text("Create"),
      ),
      child: Column(
        children: [
          const Divider(height: 1),
          Watch(
            (_) => Expanded(
              child: SalesChannelsTable(
                salesChannels: viewModel.salesChannels.value.data,
                onEdit: (salesChannel) {},
                onDelete: (salesChannel) {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
