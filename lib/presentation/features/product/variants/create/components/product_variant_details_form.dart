import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/domain/models/product_option.dart';
import 'package:zentrio_admin/domain/models/product_option_value.dart';
import 'package:zentrio_admin/utils/extensions/miscellaneous_ext.dart';

import '../../../../../components/switch_card.dart';

class ProductVariantDetailsForm extends StatelessWidget {
  final List<ProductOption> options;
  final String title;
  final String sku;
  final bool manageInventory;
  final bool allowBackorders;
  final bool inventoryKit;
  final ValueChanged<bool> onManageInventoryChanged;
  final ValueChanged<bool> onAllowBackordersChanged;
  final ValueChanged<bool> onInventoryKitChanged;
  final ValueChanged<String> onTitleChanged;
  final ValueChanged<String> onSkuChanged;
  final Map<String, String> optionValues;
  final Function(String option, String value) onOptionValueSelected;

  const ProductVariantDetailsForm({
    super.key,
    required this.options,
    required this.title,
    required this.sku,
    required this.manageInventory,
    required this.allowBackorders,
    required this.inventoryKit,
    required this.optionValues,
    required this.onManageInventoryChanged,
    required this.onAllowBackordersChanged,
    required this.onInventoryKitChanged,
    required this.onTitleChanged,
    required this.onSkuChanged,
    required this.onOptionValueSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: SingleChildScrollView(
        child: ResponsiveRowColumn(
          layout: ResponsiveRowColumnType.COLUMN,
          columnSpacing: 16,
          columnCrossAxisAlignment: CrossAxisAlignment.start,
          columnMainAxisAlignment: MainAxisAlignment.start,
          children: [
            ResponsiveRowColumnItem(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Text(
                    "Variant Details",
                    style: theme.textTheme.h4,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            ResponsiveRowColumnItem(
              child: ResponsiveRowColumn(
                layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                    ? ResponsiveRowColumnType.COLUMN
                    : ResponsiveRowColumnType.ROW,
                rowSpacing: 8,
                columnSpacing: 8,
                children: [
                  ResponsiveRowColumnItem(
                    rowFlex: 1,
                    child: ShadInputFormField(
                      label: const Text('Title'),
                      initialValue: title,
                      onChanged: onTitleChanged,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                    ),
                  ),
                  ResponsiveRowColumnItem(
                    rowFlex: 1,
                    child: ShadInputFormField(
                      label: const Text('SKU'),
                      initialValue: sku,
                      onChanged: onSkuChanged,
                    ),
                  ),
                ],
              ),
            ),
            ResponsiveRowColumnItem(
              child: _ProductOptionsChunked(
                options: _chunkOptions(options, 2),
                optionValues: optionValues,
                onOptionValueSelected: onOptionValueSelected,
              ),
            ),
            const ResponsiveRowColumnItem(child: SizedBox(height: 16)),
            ResponsiveRowColumnItem(
              child: SwitchCard(
                title: "Manage inventory",
                description:
                    "When enabled, we'll change the inventory quantity for you when orders and returns are created.",
                value: manageInventory,
                onChanged: onManageInventoryChanged,
              ),
            ),
            ResponsiveRowColumnItem(
              child: SwitchCard(
                title: "Allow backorders",
                enabled: manageInventory,
                description:
                    "When enabled, customers can purchase the variant even if there's no available quantity.",
                value: allowBackorders,
                onChanged: onAllowBackordersChanged,
              ),
            ),
            ResponsiveRowColumnItem(
              child: SwitchCard(
                title: "Inventory Kit",
                enabled: manageInventory,
                description:
                    "Does this variant consist of several inventory items?",
                value: inventoryKit,
                onChanged: onInventoryKitChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<List<ProductOption>> _chunkOptions(
    List<ProductOption> options,
    int chunkSize,
  ) {
    List<List<ProductOption>> chunks = [];
    for (var i = 0; i < options.length; i += chunkSize) {
      chunks.add(
        options.sublist(
          i,
          i + chunkSize > options.length ? options.length : i + chunkSize,
        ),
      );
    }
    return chunks;
  }
}

final formKey = GlobalKey<ShadFormState>();

class _ProductOptionsChunked extends StatelessWidget {
  final List<List<ProductOption>> options;
  final Map<String, String> optionValues;

  final Function(String option, String value) onOptionValueSelected;

  const _ProductOptionsChunked({
    required this.options,
    required this.optionValues,
    required this.onOptionValueSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: options
          .asMap()
          .map(
            (parentIndex, e) => MapEntry(
              parentIndex,
              ResponsiveRowColumn(
                layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                    ? ResponsiveRowColumnType.COLUMN
                    : ResponsiveRowColumnType.ROW,
                rowSpacing: 8,
                columnSpacing: 8,
                children: e
                    .asMap()
                    .map(
                      (childIndex, productOption) => MapEntry(
                        childIndex,
                        ResponsiveRowColumnItem(
                          rowFlex: 1,
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              return ShadSelectFormField<ProductOptionValue>(
                                initialValue: ProductOptionValue(
                                  id: productOption.title,
                                  value: optionValues[productOption.title] ?? '',
                                ),
                                id: ValueKey(productOption.title),
                                label: Text(productOption.title),
                                maxWidth: e.length == 1
                                    ? constraints.maxWidth / 2
                                    : constraints.maxWidth,
                                minWidth: e.length == 1
                                    ? constraints.maxWidth / 2
                                    : constraints.maxWidth,
                                placeholder: const Text(""),
                                onChangedNullable: (value) {
                                  onOptionValueSelected(
                                    productOption.title,
                                    value?.value ?? '',
                                  );
                                },
                                validator: FormBuilderValidators.compose(
                                  [FormBuilderValidators.required()],
                                ),
                                options: productOption.values.map(
                                  (value) => ShadOption(
                                    value: value,
                                    child: Text(value.value),
                                  ),
                                ),
                                selectedOptionBuilder: (context, value) {
                                  return Text(value.value);
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    )
                    .values
                    .toList(),
              ),
            ),
          )
          .values
          .toList()
          .separatedBy(const SizedBox(height: 16)),
    );
  }
}
