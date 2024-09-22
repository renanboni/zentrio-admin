import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/di/init.dart';
import 'package:zentrio_admin/domain/models/product.dart';
import 'package:zentrio_admin/main.dart';
import 'package:zentrio_admin/presentation/features/productAttributes/product_attributes_view_model.dart';

import '../../components/sheet_footer.dart';
import '../../components/sheet_header.dart';

class ProductAttributesPage extends StatefulWidget {
  final Product product;

  const ProductAttributesPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductAttributesPage> createState() => _ProductAttributesPageState();
}

class _ProductAttributesPageState extends State<ProductAttributesPage> {
  final ProductAttributesViewModel viewModel = getIt<ProductAttributesViewModel>();

  @override
  void initState() {
    viewModel.init(widget.product);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SheetHeader(
            title: "Edit Attributes",
            onTap: () => GoRouter.of(context).pop(),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ShadInputFormField(
                  label: const Text("Width"),
                  initialValue: viewModel.product.watch(context).width,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                ShadInputFormField(
                  label: const Text("Height"),
                  initialValue: viewModel.product.watch(context).height,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                ShadInputFormField(
                  label: const Text("Length"),
                  initialValue: viewModel.product.watch(context).length,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                ShadInputFormField(
                  label: const Text("Weight"),
                  initialValue: viewModel.product.watch(context).weight,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                ShadInputFormField(
                  label: const Text("MID"),
                  initialValue: viewModel.product.watch(context).midCode,
                ),
              ],
            ),
          ),
          const Spacer(),
          SheetFooter(
            onSave: () {},
            onCancel: () {
              GoRouter.of(context).pop(false);
            },
          )
        ],
      ),
    );
  }
}
