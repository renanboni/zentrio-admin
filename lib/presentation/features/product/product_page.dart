import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/di/init.dart';
import 'package:zentrio_admin/main.dart';
import 'package:zentrio_admin/presentation/features/product/components/product_details_card.dart';
import 'package:zentrio_admin/presentation/features/product/product_view_model.dart';

class ProductPage extends StatefulWidget {
  final String productId;

  const ProductPage({
    super.key,
    required this.productId,
  });

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final ProductViewModel viewModel = getIt<ProductViewModel>();

  @override
  void initState() {
    viewModel.getProductById(widget.productId);
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
            rowCrossAxisAlignment: CrossAxisAlignment.start,
            layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                ? ResponsiveRowColumnType.COLUMN
                : ResponsiveRowColumnType.ROW,
            children: [
              ResponsiveRowColumnItem(
                rowFlex: 2,
                child: ProductDetailsCard(
                  product: viewModel.product.watch(context),
                ),
              ),
              const ResponsiveRowColumnItem(
                rowFlex: 1,
                child: SizedBox(),
              )
            ],
          ),
        )
      ],
    );
  }
}