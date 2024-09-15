import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/presentation/components/dialog_toolbar.dart';
import 'package:zentrio_admin/presentation/features/ranking/components/ranking_list.dart';
import 'package:zentrio_admin/presentation/features/ranking/ranking_view_model.dart';

class RankingPage extends StatelessWidget {
  final RankingViewModel viewModel;

  const RankingPage({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DialogToolbar(),
        Expanded(
          child: RankingList(
            categories: viewModel.categories.watch(context),
          ),
        ),
      ],
    );
  }
}
