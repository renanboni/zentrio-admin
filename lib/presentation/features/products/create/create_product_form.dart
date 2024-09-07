import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:zentrio_admin/presentation/features/products/create/products_detail_form.dart';

import '../../../components/stepper/horizontal_stepper.dart';
import '../../../components/stepper/step_item_list.dart';

class CreateProductForm extends StatelessWidget {
  const CreateProductForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: HorizontalStepper(
        showEsc: true,
        steps:  [
          StepItemList(
            title: 'Details',
            state: HorizontalStepState.editing,
            content: MaxWidthBox(
              maxWidth: MediaQuery.sizeOf(context).width * 0.5,
              child: const ProductsDetailForm(),
            ),
          ),
        ],
        onContinue: () {},
      ),
    );
  }
}
