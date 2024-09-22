import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/domain/models/product.dart';
import 'package:zentrio_admin/domain/models/product_status.dart';
import 'package:zentrio_admin/presentation/features/product/edit/product_edit_view_model.dart';

import '../../../../di/init.dart';
import '../../../components/sheet_footer.dart';
import '../../../components/sheet_header.dart';
import '../../../components/switch_card.dart';

class ProductEditPage extends StatefulWidget {
  final Product product;

  const ProductEditPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductEditPage> createState() => _ProductEditPageState();
}

class _ProductEditPageState extends State<ProductEditPage> {
  final ProductEditViewModel viewModel = getIt<ProductEditViewModel>();

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
            title: "Edit Product",
            onTap: () => GoRouter.of(context).pop(),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ShadSelectFormField<ProductStatus>(
                      id: 'product_status',
                      minWidth: double.infinity,
                      label: const Text('Status'),
                      initialValue: ProductStatus.fromString(
                        viewModel.product.watch(context).status,
                      ),
                      onChanged: (status) {
                        if (status != null) {
                          viewModel.status.set(status);
                        }
                      },
                      options: ProductStatus.values
                          .map(
                            (status) => ShadOption(
                              value: status,
                              child: Text(status.name),
                            ),
                          )
                          .toList(),
                      selectedOptionBuilder: (context, value) => Text(value.name),
                    ),
                    const SizedBox(height: 16),
                    ShadInputFormField(
                      label: const Text("Title"),
                      initialValue: viewModel.product.watch(context).title,
                      onChanged: viewModel.title.set,
                    ),
                    const SizedBox(height: 16),
                    ShadInputFormField(
                      label: const Text("Subtitle"),
                      initialValue: viewModel.product.watch(context).subtitle,
                      onChanged: viewModel.subtitle.set,
                    ),
                    const SizedBox(height: 16),
                    ShadInputFormField(
                      label: const Text("Handle"),
                      initialValue: viewModel.product.watch(context).handle,
                      onChanged: viewModel.handle.set,
                    ),
                    const SizedBox(height: 16),
                    ShadInputFormField(
                      label: const Text("Material"),
                      initialValue: viewModel.product.watch(context).material,
                      onChanged: viewModel.material.set,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16),
                    ShadInputFormField(
                      label: const Text("Description"),
                      initialValue: viewModel.product.watch(context).description,
                      onChanged: viewModel.description.set,
                      maxLines: 5,
                    ),
                    const SizedBox(height: 16),
                    SwitchCard(
                      title: "Discountable",
                      description:
                      "When unchecked, discounts will not be applied to this product",
                      value: viewModel.discountable.watch(context),
                      onChanged: viewModel.discountable.set,
                    )
                  ],
                ),
              ),
            ),
          ),
          SheetFooter(
            onSave: () async {
              viewModel.onSave(
                () {
                  ShadToaster.of(context).show(
                    const ShadToast(
                      description: Text('Product updated successfully'),
                    ),
                  );
                  GoRouter.of(context).pop(true);
                },
                () {
                  ShadToaster.of(context).show(
                    const ShadToast.destructive(
                      description: Text('Failed to update product'),
                    ),
                  );
                },
              );
            },
            onCancel: () async {
              GoRouter.of(context).pop(false);
            },
          )
        ],
      ),
    );
  }
}
