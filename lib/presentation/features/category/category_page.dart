import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:zentrio_admin/presentation/features/category/components/category_card.dart';
import 'package:zentrio_admin/presentation/features/category/components/category_organize_card.dart';

import '../../../domain/models/category.dart';

class CategoryPage extends StatelessWidget {
  final String categoryId;

  const CategoryPage({
    super.key,
    required this.categoryId,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveRowColumn(
      layout: ResponsiveRowColumnType.COLUMN,
      rowSpacing: 8,
      columnSpacing: 8,
      children: [
        ResponsiveRowColumnItem(
          child: ResponsiveRowColumn(
            rowSpacing: 12,
            columnSpacing: 8,
            layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                ? ResponsiveRowColumnType.COLUMN
                : ResponsiveRowColumnType.ROW,
            children: [
              ResponsiveRowColumnItem(
                rowFlex: 2,
                child: CategoryCard(
                  category: Category.empty().copyWith(name: "Tenis"),
                ),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: CategoryOrganizeCard(
                  category: Category.empty(),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
