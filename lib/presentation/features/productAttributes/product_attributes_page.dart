import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/domain/models/product.dart';

import '../../components/sheet_footer.dart';
import '../../components/sheet_header.dart';

class ProductAttributesPage extends StatelessWidget {
  final Product product;

  const ProductAttributesPage({
    super.key,
    required this.product,
  });

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
                  initialValue: product.width.toString(),
                ),
                const SizedBox(height: 16),
                ShadInputFormField(
                  label: const Text("Height"),
                  initialValue: product.height.toString(),
                ),
                const SizedBox(height: 16),
                ShadInputFormField(
                  label: const Text("Length"),
                  initialValue: product.length.toString(),
                ),
                const SizedBox(height: 16),
                ShadInputFormField(
                  label: const Text("Weight"),
                  initialValue: product.weight.toString(),
                ),
                const SizedBox(height: 16),
                ShadInputFormField(
                  label: const Text("MID"),
                  initialValue: product.midCode,
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
