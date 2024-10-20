import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/presentation/features/categories/create/create_category_view_model.dart';
import 'package:zentrio_admin/presentation/features/products/create/create_product_form.dart';
import 'package:zentrio_admin/utils/extensions/context_ext.dart';

import '../../../../di/init.dart';
import '../../../components/stepper/horizontal_stepper.dart';
import '../../../components/stepper/step_item_list.dart';
import 'categories_rank.dart';
import 'category_details_form.dart';

class CreateCategoryPage extends StatefulWidget {
  const CreateCategoryPage({
    super.key,
  });

  @override
  State<CreateCategoryPage> createState() => _CreateCategoryPageState();
}

class _CreateCategoryPageState extends State<CreateCategoryPage> {
  final CreateCategoryViewModel viewModel = getIt<CreateCategoryViewModel>();

  @override
  Widget build(BuildContext context) {
    return HorizontalStepper(
      showEsc: true,
      steps: [
        StepItemList(
          title: 'Details',
          state: HorizontalStepState.editing,
          content: MaxWidthBox(
            maxWidth: context.maxWidth,
            child: CategoryDetailsForm(
              viewModel: viewModel,
            ),
          ),
        ),
        StepItemList(
          title: 'Organize Ranking',
          state: HorizontalStepState.disabled,
          content: MaxWidthBox(
            maxWidth: context.maxWidth,
            child: CategoriesRank(
              categories: viewModel.ranking.watch(context),
              newCategoryName: viewModel.title.value,
              onRankChanged: viewModel.categories.set,
            ),
          ),
        ),
      ],
      onComplete: () async {
        viewModel.createCategory(
          () {
            context.success("Category created successfully");
            GoRouter.of(context).pop(true);
          },
          () => context.error("Failed to create category"),
        );
      },
    );
  }
}
