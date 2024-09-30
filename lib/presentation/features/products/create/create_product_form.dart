import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/presentation/features/products/create/create_product_viewmodel.dart';
import 'package:zentrio_admin/presentation/features/products/create/product_organize_form.dart';
import 'package:zentrio_admin/presentation/features/products/create/products_detail_form.dart';
import 'package:zentrio_admin/utils/extensions/context_ext.dart';

import '../../../../di/init.dart';
import '../../../components/stepper/horizontal_stepper.dart';
import '../../../components/stepper/step_item_list.dart';

class CreateProductForm extends StatefulWidget {
  const CreateProductForm({super.key});

  @override
  State<CreateProductForm> createState() => _CreateProductFormState();
}

class _CreateProductFormState extends State<CreateProductForm> {
  final CreateProductViewModel viewModel = getIt<CreateProductViewModel>();

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
            child: ProductsDetailForm(
              viewModel: viewModel,
            ),
          ),
        ),
        StepItemList(
          title: 'Organize',
          state: HorizontalStepState.disabled,
          content: MaxWidthBox(
            maxWidth: context.maxWidth,
            child: Watch(
              (_) {
                return ProductOrganizeForm(
                  categories: viewModel.categories.value,
                  discountable: viewModel.discountable.value,
                  onDiscountableChanged: viewModel.discountable.set,
                );
              },
            ),
          ),
        ),
      ],
      onComplete: () async {
        viewModel.createProduct(
          () {
            context.success("Product created successfully");
            GoRouter.of(context).pop(true);
          },
          () {
            print('Error creating product');
          },
        );
      },
    );
  }
}
