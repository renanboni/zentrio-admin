import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/di/init.dart';
import 'package:zentrio_admin/main.dart';
import 'package:zentrio_admin/presentation/features/promotions/create/create_promotion_view_model.dart';
import 'package:zentrio_admin/utils/extensions/context_ext.dart';
import 'package:zentrio_admin/utils/extensions/localization_ext.dart';
import '../../../../domain/models/promotion_type.dart';
import '../../../components/stepper/horizontal_stepper.dart';
import '../../../components/stepper/step_item_list.dart';
import 'components/promotion_details_form.dart';
import 'components/promotion_type_form.dart';

class CreatePromotionPage extends StatefulWidget {
  const CreatePromotionPage({super.key});

  @override
  State<CreatePromotionPage> createState() => _CreatePromotionPageState();
}

class _CreatePromotionPageState extends State<CreatePromotionPage> {
  final CreatePromotionViewModel viewModel = getIt<CreatePromotionViewModel>();

  @override
  Widget build(BuildContext context) {
    return HorizontalStepper(
      showEsc: true,
      steps: [
      /*  StepItemList(
          title: context.loc.types,
          state: HorizontalStepState.editing,
          content: MaxWidthBox(
            maxWidth: context.maxWidth,
            child: Watch(
              (c) => PromotionTypeForm(
                selectedType: viewModel.promotionType.value,
                onTypeChanged: viewModel.promotionType.set,
              ),
            ),
          ),
        ),*/
        StepItemList(
          title: context.loc.details,
          state: HorizontalStepState.editing,
          content: MaxWidthBox(
            maxWidth: context.maxWidth,
            child: Watch(
              (c) => PromotionDetailsForm(
                attributes: viewModel.promotionAttributes.value,
                onMethodChanged: viewModel.promotionMethod.set,
                method: viewModel.promotionMethod.value,
                conditions: viewModel.conditions.value,
                onAddCondition: viewModel.onAddCondition,
                onClearAll: viewModel.onClearAll,
                onAttributeSelected: viewModel.onAttributeSelected,
              ),
            ),
          ),
        ),
      ],
      onComplete: () {},
    );
  }
}
