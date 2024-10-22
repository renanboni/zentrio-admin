import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/presentation/features/products/components/variants.dart';
import 'package:zentrio_admin/presentation/features/products/create/components/media_list.dart';
import 'package:zentrio_admin/presentation/features/products/create/create_product_viewmodel.dart';
import 'package:zentrio_admin/presentation/features/products/create/components/product_options.dart';

class ProductsDetailForm extends StatefulWidget {
  final CreateProductViewModel viewModel;

  const ProductsDetailForm({
    super.key,
    required this.viewModel,
  });

  @override
  State<ProductsDetailForm> createState() => _ProductsDetailFormState();
}

class _ProductsDetailFormState extends State<ProductsDetailForm> {
  late TextEditingController title = TextEditingController(
    text: widget.viewModel.productTitle.value,
  );

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: SingleChildScrollView(
        child: ResponsiveRowColumn(
          layout: ResponsiveRowColumnType.COLUMN,
          rowSpacing: 4,
          columnSpacing: 16,
          columnCrossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ResponsiveRowColumnItem(
              child: SizedBox(height: 16),
            ),
            ResponsiveRowColumnItem(
              child: Text(
                "General",
                style: theme.textTheme.large,
              ),
            ),
            ResponsiveRowColumnItem(
              child: ResponsiveRowColumn(
                layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                    ? ResponsiveRowColumnType.COLUMN
                    : ResponsiveRowColumnType.ROW,
                rowSpacing: 4,
                columnSpacing: 8,
                children: [
                  ResponsiveRowColumnItem(
                    rowFlex: 1,
                    child: ShadInputFormField(
                      label: const Text('Title'),
                      controller: title,
                      onChanged: widget.viewModel.productTitle.set,
                      placeholder: const Text("Winter Jacket"),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                    ),
                  ),
                  ResponsiveRowColumnItem(
                    rowFlex: 1,
                    child: ShadInputFormField(
                      label: const Text('Subtitle'),
                      placeholder: const Text("Warm and cosy"),
                    ),
                  ),
                  ResponsiveRowColumnItem(
                    rowFlex: 1,
                    child: ShadInputFormField(
                      label: const Text('Handle'),
                      placeholder: const Text("winter-jacket"),
                    ),
                  ),
                ],
              ),
            ),
            if (kIsWeb)
              ResponsiveRowColumnItem(
                child: MediaList(
                  files: widget.viewModel.files.watch(context),
                  onDelete: widget.viewModel.onDeleteFile,
                  onMakeThumbnail: widget.viewModel.onMakeThumbnail,
                  onFilesAdded: widget.viewModel.onFilesAdded,
                ),
              ),
            const ResponsiveRowColumnItem(
              child: Divider(
                height: 1,
              ),
            ),
            ResponsiveRowColumnItem(
              child: Variants(
                showProductOptions:
                    widget.viewModel.hasVariants.watch(context),
                onChanged: widget.viewModel.onToggleProductOptions,
              ),
            ),
            if (widget.viewModel.hasVariants.watch(context))
              ResponsiveRowColumnItem(
                child: ProductOptions(
                  showAtLeastOneOptionAlert: widget.viewModel
                      .showAtLeastOneOptionAlert.watch(context),
                  productOptions:
                      widget.viewModel.productOptions.watch(context),
                  productVariants: widget.viewModel.variants.watch(context),
                  showAddOptionsAlert:
                      widget.viewModel.showAddOptionsAlert.watch(context),
                  onRemove: widget.viewModel.onRemoveProductOption,
                  onAddProductOption: widget.viewModel.onAddProductOption,
                  onTitleChanged: widget.viewModel.onProductOptionTitleChanged,
                  onValuesChanged:
                      widget.viewModel.onProductOptionValuesChanged,
                  onValueRemoved: widget.viewModel.onProductOptionValueRemoved,
                  onCheckAll: widget.viewModel.onCheckAll,
                  onVariantChecked: widget.viewModel.onVariantSelected,
                  checkAll: widget.viewModel.checkAll.watch(context),
                ),
              )
          ],
        ),
      ),
    );
  }
}
