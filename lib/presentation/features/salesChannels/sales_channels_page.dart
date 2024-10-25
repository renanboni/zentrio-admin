import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/di/init.dart';
import 'package:zentrio_admin/presentation/components/card_scaffold.dart';
import 'package:zentrio_admin/presentation/features/banners/banners_page.dart';
import 'package:zentrio_admin/presentation/features/salesChannels/sales_channels_view_model.dart';
import 'package:zentrio_admin/utils/extensions/context_ext.dart';
import 'package:zentrio_admin/utils/extensions/localization_ext.dart';

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
      title: context.loc.salesChannel,
      subtitle: context.loc.salesChannelsDescription,
      trailing: ShadButton(
        size: ShadButtonSize.sm,
        child: Text(context.loc.create),
        onPressed: () async {
          final result = await GoRouter.of(context).push('/sales-channels/create');

          if (result == true) {
            viewModel.refresh();
          }
        },
      ),
      child: Column(
        children: [
          const Divider(height: 1),
          Watch(
            (_) => Expanded(
              child: SalesChannelsTable(
                salesChannels: viewModel.salesChannels.value.data,
                onEdit: (salesChannel) {},
                onDelete: (salesChannel) {
                  viewModel.onDeleteSalesChannel(
                    salesChannel.id,
                    () {
                      GoRouter.of(context).pop();
                      context.success("Sales channel deleted successfully");
                    },
                    () => context.error("Failed to delete sales channel"),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
