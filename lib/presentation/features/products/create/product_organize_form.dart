import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/domain/models/category.dart';
import 'package:zentrio_admin/presentation/components/switch_card.dart';

class ProductOrganizeForm extends StatelessWidget {
  final List<Category> categories;
  final bool discountable;
  final ValueChanged<bool> onDiscountableChanged;

  const ProductOrganizeForm({
    super.key,
    required this.categories,
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
                child: ShadSelectFormField<String>(
                  id: 'type',
                  minWidth: double.infinity,
                  label: const Text('Type (optional)'),
                  initialValue: "",
                  onChanged: (value) {},
                  options: const [],
                  selectedOptionBuilder: (context, value) => const Text(""),
                ),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: ShadSelectFormField<String>(
                  id: 'collection',
                  minWidth: double.infinity,
                  label: const Text('Collection (optional)'),
                  initialValue: "",
                  onChanged: (value) {},
                  options: const [],
                  selectedOptionBuilder: (context, value) => const Text(""),
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
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return ShadSelectFormField<Category>(
                      id: 'category',
                      maxWidth: constraints.maxWidth,
                      minWidth: constraints.maxWidth,
                      placeholder: const Text(""),
                      label: const Text('Categories (optional)'),
                      initialValue: null,
                      onChanged: (value) {},
                      options: categories
                          .map(
                            (e) => ShadOption(
                              value: e,
                              child: Text(e.name),
                            ),
                          )
                          .toList(),
                      selectedOptionBuilder: (context, value) =>
                          Text(value.name),
                    );
                  },
                ),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: ShadSelectFormField<String>(
                  id: 'tags',
                  minWidth: double.infinity,
                  label: const Text('Tags (optional)'),
                  initialValue: "",
                  onChanged: (value) {},
                  options: const [],
                  selectedOptionBuilder: (context, value) => const Text(""),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
