import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/domain/models/category.dart';
import 'package:zentrio_admin/domain/models/collection.dart';
import 'package:zentrio_admin/domain/models/product_tag.dart';
import 'package:zentrio_admin/domain/models/product_type.dart';
import 'package:zentrio_admin/presentation/components/optional_label.dart';
import 'package:zentrio_admin/presentation/components/switch_card.dart';
import 'package:zentrio_admin/utils/extensions/string_ext.dart';

class ProductOrganizeForm extends StatelessWidget {
  final List<Category> categories;
  final List<Collection> collections;
  final List<ProductType> types;
  final List<ProductTag> tags;
  final bool discountable;
  final ValueChanged<bool> onDiscountableChanged;

  const ProductOrganizeForm({
    super.key,
    required this.categories,
    required this.collections,
    required this.types,
    required this.tags,
    required this.discountable,
    required this.onDiscountableChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ResponsiveRowColumn(
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
            rowSpacing: 12,
            columnSpacing: 12,
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
                          onChanged: (value) {},
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
                          onChanged: (value) {},
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
            rowSpacing: 12,
            columnSpacing: 12,
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
                          onChanged: (value) {},
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
                          onChanged: (value) {},
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
        )
      ],
    );
  }
}
