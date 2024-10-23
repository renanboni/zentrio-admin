import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/domain/models/category.dart';
import 'package:zentrio_admin/domain/models/collection.dart';
import 'package:zentrio_admin/domain/models/product_tag.dart';
import 'package:zentrio_admin/domain/models/product_type.dart';
import 'package:zentrio_admin/presentation/components/optional_label.dart';
import 'package:zentrio_admin/presentation/components/switch_card.dart';
import 'package:zentrio_admin/presentation/features/products/create/components/sales_channels_item_list.dart';
import 'package:zentrio_admin/utils/extensions/string_ext.dart';

import '../../../../../domain/models/sales_channel.dart';

class ProductOrganizeForm extends StatelessWidget {
  final List<Category> categories;
  final List<Collection> collections;
  final List<ProductType> types;
  final List<ProductTag> tags;
  final List<SalesChannel> salesChannels;
  final List<SalesChannel> selectedSalesChannels;
  final bool discountable;
  final ValueChanged<bool> onDiscountableChanged;
  final ValueChanged<SalesChannel> onSalesChannelUnselected;
  final ValueChanged<Collection> onCollectionSelected;
  final ValueChanged<ProductType> onTypeSelected;
  final ValueChanged<ProductTag> onTagSelected;
  final ValueChanged<List<Category>> onCategoriesSelected;

  const ProductOrganizeForm({
    super.key,
    required this.categories,
    required this.collections,
    required this.types,
    required this.tags,
    required this.salesChannels,
    required this.selectedSalesChannels,
    required this.discountable,
    required this.onDiscountableChanged,
    required this.onSalesChannelUnselected,
    required this.onCollectionSelected,
    required this.onTypeSelected,
    required this.onTagSelected,
    required this.onCategoriesSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ResponsiveRowColumn(
      layout: ResponsiveRowColumnType.COLUMN,
      rowSpacing: 16,
      columnSpacing: 16,
      columnCrossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ResponsiveRowColumnItem(
          child: SizedBox(height: 16),
        ),
        ResponsiveRowColumnItem(
          child: Text(
            "Organize",
            style: theme.textTheme.large,
          ),
        ),
        ResponsiveRowColumnItem(
          child: SwitchCard(
            title: "Discountable",
            description:
                "When unchecked, discounts will not be applied to this product",
            value: discountable,
            onChanged: onDiscountableChanged,
          ),
        ),
        ResponsiveRowColumnItem(
          child: ResponsiveRowColumn(
            layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                ? ResponsiveRowColumnType.COLUMN
                : ResponsiveRowColumnType.ROW,
            rowSpacing: 16,
            columnSpacing: 16,
            children: [
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: Column(
                  children: [
                    const OptionalLabel(label: "Type"),
                    const SizedBox(height: 8),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        return ShadSelect<ProductType>(
                          maxWidth: constraints.maxWidth,
                          minWidth: constraints.maxWidth,
                          placeholder: const Text(""),
                          onChanged: (value) => onTypeSelected(value),
                          options: types
                              .map(
                                (e) => ShadOption(
                                  value: e,
                                  child: Text(e.value),
                                ),
                              )
                              .toList(),
                          selectedOptionBuilder: (context, value) =>
                              Text(value.value),
                        );
                      },
                    ),
                  ],
                ),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: Column(
                  children: [
                    const OptionalLabel(label: "Collection"),
                    const SizedBox(height: 8),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        return ShadSelect<Collection>(
                          maxWidth: constraints.maxWidth,
                          minWidth: constraints.maxWidth,
                          placeholder: const Text(""),
                          onChanged: (value) => onCollectionSelected(value),
                          options: collections
                              .map(
                                (e) => ShadOption(
                                  value: e,
                                  child: Text(e.title),
                                ),
                              )
                              .toList(),
                          selectedOptionBuilder: (context, value) =>
                              Text(value.title),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        ResponsiveRowColumnItem(
          child: ResponsiveRowColumn(
            layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                ? ResponsiveRowColumnType.COLUMN
                : ResponsiveRowColumnType.ROW,
            rowSpacing: 16,
            columnSpacing: 16,
            children: [
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: Column(
                  children: [
                    const OptionalLabel(label: "Categories"),
                    const SizedBox(height: 8),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        return ShadSelect<Category>.multiple(
                          maxWidth: constraints.maxWidth,
                          minWidth: constraints.maxWidth,
                          closeOnSelect: false,
                          closeOnTapOutside: true,
                          allowDeselection: true,
                          placeholder: const Text(""),
                          initialValues: categories
                              .where((e) => e.selected)
                              .toList(),
                          onChanged: (value) => onCategoriesSelected(value),
                          options: categories
                              .map(
                                (e) => ShadOption(
                                  value: e,
                                  child: Text(e.name),
                                ),
                              )
                              .toList(),
                          selectedOptionsBuilder: (context, values) => Text(
                            values.map((v) => v.name.capitalize()).join(', '),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: Column(
                  children: [
                    const OptionalLabel(label: "Tags"),
                    const SizedBox(height: 8),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        return ShadSelect<ProductTag>(
                          maxWidth: constraints.maxWidth,
                          minWidth: constraints.maxWidth,
                          placeholder: const Text(""),
                          onChanged: (value) => onTagSelected(value),
                          options: tags
                              .map(
                                (e) => ShadOption(
                                  value: e,
                                  child: Text(e.value),
                                ),
                              )
                              .toList(),
                          selectedOptionBuilder: (context, value) =>
                              Text(value.value),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        ResponsiveRowColumnItem(
          child: SalesChannelsItemList(
            salesChannels: selectedSalesChannels,
            onRemove: onSalesChannelUnselected,
            onAdd: () {
              showShadSheet(
                side: ShadSheetSide.right,
                context: context,
                builder: (context) => SalesChannelsSheet(
                  salesChannels: salesChannels,
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
