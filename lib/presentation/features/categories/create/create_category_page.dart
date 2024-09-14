import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:zentrio_admin/presentation/features/categories/create/create_category_view_model.dart';

import '../../../components/stepper/horizontal_stepper.dart';
import '../../../components/stepper/step_item_list.dart';
import 'categories_rank.dart';
import 'category_details_form.dart';

class CreateCategoryPage extends StatelessWidget {
  final CreateCategoryViewModel viewModel;

  const CreateCategoryPage({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.sizeOf(context).width * 0.5;

    return Expanded(
      child: HorizontalStepper(
        showEsc: true,
        steps: [
          StepItemList(
            title: 'Details',
            state: HorizontalStepState.editing,
            content: MaxWidthBox(
              maxWidth: maxWidth,
              child: CategoryDetailsForm(
                viewModel: viewModel,
              ),
            ),
          ),
          StepItemList(
            title: 'Organize Ranking',
            state: HorizontalStepState.disabled,
            content: MaxWidthBox(
              maxWidth: maxWidth,
              child: const CategoriesRank(),
            ),
          ),
        ],
        onContinue: () {},
      ),
    );
  }
}
