import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/presentation/features/category/category_view_model.dart';
import 'package:zentrio_admin/presentation/features/category/components/category_card.dart';
import 'package:zentrio_admin/presentation/features/category/components/category_organize_card.dart';

class CategoryPage extends StatefulWidget {
  final CategoryViewModel viewModel;
  final String categoryId;

  const CategoryPage({
    super.key,
    required this.categoryId,
    required this.viewModel,
  });

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  @override
  void initState() {
    widget.viewModel.getCategory(widget.categoryId);
    super.initState();
  }

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
                  category: widget.viewModel.category.watch(context),
                ),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: CategoryOrganizeCard(
                  category: widget.viewModel.category.watch(context),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
