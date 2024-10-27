import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/presentation/features/products/create/create_product_viewmodel.dart';
import 'package:zentrio_admin/presentation/features/products/create/components/product_organize_form.dart';
import 'package:zentrio_admin/presentation/features/products/create/components/products_detail_form.dart';
import 'package:zentrio_admin/utils/extensions/context_ext.dart';
import 'package:zentrio_admin/utils/extensions/localization_ext.dart';

import '../../../../di/init.dart';
import '../../../../utils/constants.dart';
import '../../../components/stepper/horizontal_stepper.dart';
import '../../../components/stepper/step_item_list.dart';
import 'components/create_product_variants_form.dart';

class CreateProductForm extends StatefulWidget {
  const CreateProductForm({super.key});

  @override
  State<CreateProductForm> createState() => _CreateProductFormState();
}

class _CreateProductFormState extends State<CreateProductForm> {
  final CreateProductViewModel viewModel = getIt<CreateProductViewModel>();
  final CurrencyTextInputFormatter _formatter = CurrencyTextInputFormatter.currency(
    locale: kDefaultLocale,
    symbol: kCurrencySymbol,
  );

  @override
  Widget build(BuildContext context) {
    return HorizontalStepper(
      showEsc: true,
      steps: [
        StepItemList(
          title: context.loc.details,
          state: HorizontalStepState.editing,
          extraValidator: () => viewModel.hasValidVariants(),
          content: MaxWidthBox(
            maxWidth: context.maxWidth,
            child: ProductsDetailForm(
              viewModel: viewModel,
            ),
          ),
        ),
        StepItemList(
          title: context.loc.organize,
          state: HorizontalStepState.disabled,
          content: MaxWidthBox(
            maxWidth: context.maxWidth,
            child: Watch(
              (_) {
                return ProductOrganizeForm(
                  categories: viewModel.categories.value,
                  collections: viewModel.collections.value,
                  discountable: viewModel.discountable.value,
                  tags: viewModel.tags.value,
                  types: viewModel.types.value,
                  salesChannels: viewModel.salesChannels.value.data,
                  selectedSalesChannels: viewModel.selectedSalesChannels.value,
                  onDiscountableChanged: viewModel.discountable.set,
                  onSalesChannelUnselected: viewModel.unselectSalesChannel,
                  onCollectionSelected: viewModel.onCollectionSelected,
                  onTypeSelected: viewModel.onProductTypeSelected,
                  onTagsSelected: viewModel.onProductTagsSelected,
                  onCategoriesSelected: viewModel.onCategoriesSelected,
                );
              },
            ),
          ),
        ),
        StepItemList(
          title: context.loc.variants,
          state: HorizontalStepState.disabled,
          content: MaxWidthBox(
            maxWidth: double.infinity,
            child: Watch(
              (_) {
                return CreateProductVariantsForm(
                  variants: viewModel.variants.value,
                  formatter: _formatter,
                  onManageInventoryChanged: viewModel.onManageInventoryChanged,
                  onAllowBackorderChanged: viewModel.onAllowBackorderChanged,
                  onHasInventoryKitChanged: viewModel.onHasInventoryKitChanged,
                  onTitleChanged: viewModel.onVariantTitleChanged,
                  onSkuChanged: viewModel.onVariantSkuChanged,
                  onPriceChanged: viewModel.onVariantPriceChanged,
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
