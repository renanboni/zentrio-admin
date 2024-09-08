import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/presentation/components/switch_card.dart';

class ProductOrganizeForm extends StatelessWidget {
  const ProductOrganizeForm({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ResponsiveRowColumn(
      layout: ResponsiveRowColumnType.COLUMN,
      rowSpacing: 4,
      columnSpacing: 16,
      columnCrossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ResponsiveRowColumnItem(
          child: Text(
            "Organize",
            style: theme.textTheme.large,
          ),
        ),
        const ResponsiveRowColumnItem(
          child: SwitchCard(
            title: "Discountable",
            description: "When unchecked, discounts will not be applied to this product",
          ),
        )
      ],
    );
  }
}