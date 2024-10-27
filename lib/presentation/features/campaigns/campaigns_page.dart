import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/presentation/components/card_scaffold.dart';
import 'package:zentrio_admin/utils/extensions/localization_ext.dart';

class CampaignsPage extends StatelessWidget {
  const CampaignsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CardScaffold(
      title: context.loc.campaigns,
      trailing: ShadButton(
        child: Text(context.loc.create),
        onPressed: () {
          GoRouter.of(context).go("/campaigns/create");
        },
      ),
      child: Container(),
    );
  }
}
