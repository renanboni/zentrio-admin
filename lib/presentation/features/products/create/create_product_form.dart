import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/main.dart';
import 'package:zentrio_admin/presentation/features/products/create/create_product_viewmodel.dart';
import 'package:zentrio_admin/presentation/features/products/create/product_organize_form.dart';
import 'package:zentrio_admin/presentation/features/products/create/products_detail_form.dart';

import '../../../components/stepper/horizontal_stepper.dart';
import '../../../components/stepper/step_item_list.dart';

class CreateProductForm extends StatelessWidget {
  final CreateProductViewModel viewModel;

  const CreateProductForm({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: HorizontalStepper(
        showEsc: true,
        steps: [
          StepItemList(
            title: 'Details',
            state: HorizontalStepState.editing,
            content: MaxWidthBox(
              maxWidth: MediaQuery.sizeOf(context).width * 0.5,
              child: ProductsDetailForm(
                viewModel: viewModel,
              ),
            ),
          ),
          StepItemList(
            title: 'Organize',
            state: HorizontalStepState.disabled,
            content: MaxWidthBox(
              maxWidth: MediaQuery.sizeOf(context).width * 0.5,
              child: ProductOrganizeForm(
                categories: viewModel.categories.watch(context),
              ),
            ),
          ),
        ],
        onComplete: () {},
      ),
    );
  }
}
