import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/main.dart';
import 'package:zentrio_admin/presentation/features/product/variants/create/components/product_variant_details_form.dart';
import 'package:zentrio_admin/presentation/features/product/variants/create/product_create_variants_view_model.dart';
import 'package:zentrio_admin/utils/extensions/context_ext.dart';

import '../../../../../di/init.dart';
import '../../../../components/stepper/horizontal_stepper.dart';
import '../../../../components/stepper/step_item_list.dart';
import 'components/product_variant_prices_form.dart';

class ProductCreateVariantPage extends StatefulWidget {
  final String productId;

  const ProductCreateVariantPage({
    super.key,
    required this.productId,
  });

  @override
  State<ProductCreateVariantPage> createState() => _ProductCreateVariantPageState();
}

class _ProductCreateVariantPageState extends State<ProductCreateVariantPage> {
  final ProductCreateVariantsViewModel _viewModel = getIt<ProductCreateVariantsViewModel>();

  @override
  void initState() {
    _viewModel.init(widget.productId);
    super.initState();
  }

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
            child: ProductVariantDetailsForm(
              options: _viewModel.options.watch(context),
            ),
          ),
        ),
        StepItemList(
          state: HorizontalStepState.disabled,
          title: 'Prices',
          content: MaxWidthBox(
            maxWidth: context.maxWidth,
            child: const ProductVariantPricesForm(),
          ),
        ),
      ],
      onComplete: () {},
      onEsc: () {
        GoRouter.of(context).pop();
      },
    );
  }
}