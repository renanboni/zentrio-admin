import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/presentation/components/card_scaffold.dart';
import 'package:zentrio_admin/utils/extensions/localization_ext.dart';

class PromotionsPage extends StatelessWidget {
  const PromotionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CardScaffold(
      title: context.loc.promotions,
      trailing: ShadButton(
        child: Text(context.loc.create),
        onPressed: () async {
          final result = await GoRouter.of(context).push("/promotions/create");

          /*  if (result == true) {
            viewModel.refresh();
          }*/
        },
      ),
      child: Container(),
    );
  }
}
