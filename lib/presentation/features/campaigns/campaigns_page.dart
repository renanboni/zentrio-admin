import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/di/init.dart';
import 'package:zentrio_admin/presentation/components/card_scaffold.dart';
import 'package:zentrio_admin/presentation/features/campaigns/campaigns_view_model.dart';
import 'package:zentrio_admin/utils/extensions/localization_ext.dart';
import 'package:zentrio_admin/utils/extensions/string_ext.dart';

import '../../components/data_table_view.dart';
import '../../components/edit_context_menu.dart';

class CampaignsPage extends StatefulWidget {
  const CampaignsPage({super.key});

  @override
  State<CampaignsPage> createState() => _CampaignsPageState();
}

class _CampaignsPageState extends State<CampaignsPage> {

  final CampaignsViewModel viewModel = getIt<CampaignsViewModel>();

  @override
  Widget build(BuildContext context) {
    return CardScaffold(
      title: context.loc.campaigns,
      trailing: ShadButton(
        child: Text(context.loc.create),
        onPressed: () async {
          final result = await GoRouter.of(context).push("/campaigns/create");

          if (result == true) {
            viewModel.refresh();
          }
        },
      ),
      child: Expanded(
        child: Column(
          children: [
            const Divider(height: 1),
            Watch(
                  (_) => Expanded(
                child: DataTableView(
                  onRowTap: (campaign) {
                    GoRouter.of(context).go("/campaign/${campaign.id}");
                  },
                  columns:  [
                    context.loc.name,
                    context.loc.description,
                    context.loc.handle,
                    context.loc.startDate,
                    context.loc.endDate,
                    "",
                  ],
                  data: viewModel.campaigns.value.data,
                  cellBuilder: (campaign) => [
                    DataCell(Text(campaign.name)),
                    DataCell(Text(campaign.description)),
                    DataCell(Text(campaign.campaignIdentifier)),
                    DataCell(Text(campaign.startsAt.yMMMd())),
                    DataCell(Text(campaign.endsAt.yMMMd())),
                    DataCell(
                      Align(
                        alignment: Alignment.centerRight,
                        child: EditContextMenu(
                          deleteDialogTitle: context.loc.areYouSure,
                          deleteDialogDescription:
                          "You are about to delete the campaign ${campaign.name}. This action cannot be undone.",
                          onEdit: () => {
                           /* GoRouter.of(context)
                                .go("/product_types/${productType.id}/edit")*/
                          },
                          onDelete: () => {
                       /*     viewModel.onDeleted(productType, () {
                              context.success("Type deleted successfully");
                              GoRouter.of(context).pop();
                            }, () {
                              context.error("Failed to delete type");
                            })*/
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
