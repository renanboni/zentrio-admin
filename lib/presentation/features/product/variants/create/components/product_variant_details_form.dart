import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/domain/models/product_option.dart';
import 'package:zentrio_admin/domain/models/product_option_value.dart';

import '../../../../../components/switch_card.dart';

class ProductVariantDetailsForm extends StatelessWidget {
  final List<ProductOption> options;

  const ProductVariantDetailsForm({
    super.key,
    required this.options,
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
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                    ),
                  ),
                  ResponsiveRowColumnItem(
                    rowFlex: 1,
                    child: ShadInputFormField(
                      label: const Text('SKU'),
                    ),
                  ),
                ],
              ),
            ),
            ResponsiveRowColumnItem(
              child: _ProductOptionsChunked(
                options: _chunkOptions(options, 2),
              ),
            ),
            const ResponsiveRowColumnItem(child: SizedBox(height: 16)),
            ResponsiveRowColumnItem(
              child: SwitchCard(
                title: "Manage inventory",
                description:
                "When enabled, we'll change the inventory quantity for you when orders and returns are created.",
                value: true,
                onChanged: (value) {},
              ),
            ),
            ResponsiveRowColumnItem(
              child: SwitchCard(
                title: "Allow backorders",
                description:
                "When enabled, customers can purchase the variant even if there's no available quantity.",
                value: true,
                onChanged: (value) {},
              ),
            ),
            ResponsiveRowColumnItem(
              child: SwitchCard(
                title: "Inventory Kit",
                description:
                "Does this variant consist of several inventory items?",
                value: true,
                onChanged: (value) {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<List<ProductOption>> _chunkOptions(
      List<ProductOption> options, int chunkSize) {
    List<List<ProductOption>> chunks = [];
    for (var i = 0; i < options.length; i += chunkSize) {
      chunks.add(options.sublist(
          i, i + chunkSize > options.length ? options.length : i + chunkSize));
    }
    return chunks;
  }
}

class _ProductOptionsChunked extends StatelessWidget {
  final List<List<ProductOption>> options;

  const _ProductOptionsChunked({
    required this.options,
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
                                label: Text(productOption.title),
                                maxWidth: e.length == 1
                                    ? constraints.maxWidth / 2
                                    : constraints.maxWidth,
                                minWidth: e.length == 1
                                    ? constraints.maxWidth / 2
                                    : constraints.maxWidth,
                                placeholder: const Text(""),
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
          .toList(),
    );
  }
}
