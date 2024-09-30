import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/presentation/features/category/category_view_model.dart';
import 'package:zentrio_admin/presentation/features/category/components/category_card.dart';
import 'package:zentrio_admin/presentation/features/category/components/category_organize_card.dart';
import 'package:zentrio_admin/presentation/features/category/components/products_card.dart';

import '../../../di/init.dart';

class CategoryPage extends StatefulWidget {
  final String categoryId;

  const CategoryPage({
    super.key,
    required this.categoryId,
  });

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final CategoryViewModel viewModel = getIt<CategoryViewModel>();

  @override
  void initState() {
    viewModel.getCategory(widget.categoryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ResponsiveRowColumn(
        layout: ResponsiveRowColumnType.COLUMN,
        rowSpacing: 8,
        columnSpacing: 8,
        children: [
          ResponsiveRowColumnItem(
            child: ResponsiveRowColumn(
              rowSpacing: 12,
              columnSpacing: 8,
              rowCrossAxisAlignment: CrossAxisAlignment.start,
              layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                  ? ResponsiveRowColumnType.COLUMN
                  : ResponsiveRowColumnType.ROW,
              children: [
                ResponsiveRowColumnItem(
                  rowFlex: 2,
                  child: Column(
                    children: [
                      CategoryCard(
                        category: viewModel.category.watch(context),
                        onRefresh: () => viewModel.getCategory(widget.categoryId),
                      ),
                      const SizedBox(height: 16),
                      const ProductsCard(products: []),
                    ],
                  ),
                ),
                ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: CategoryOrganizeCard(
                    category: viewModel.category.watch(context),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
