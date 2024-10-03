import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/di/init.dart';
import 'package:zentrio_admin/domain/models/category.dart';
import 'package:zentrio_admin/domain/models/collection.dart';
import 'package:zentrio_admin/domain/models/product.dart';
import 'package:zentrio_admin/presentation/components/optional_label.dart';
import 'package:zentrio_admin/presentation/features/categories/create/create_category_page.dart';
import 'package:zentrio_admin/presentation/features/category/components/products_card.dart';
import 'package:zentrio_admin/presentation/features/product/organization/product_organization_view_model.dart';
import 'package:zentrio_admin/utils/extensions/context_ext.dart';

import '../../../components/select.dart';
import '../../../components/sheet_footer.dart';
import '../../../components/sheet_header.dart';

class ProductOrganizationPage extends StatefulWidget {
  final String productId;

  const ProductOrganizationPage({
    super.key,
    required this.productId,
  });

  @override
  State<ProductOrganizationPage> createState() =>
      _ProductOrganizationPageState();
}

class _ProductOrganizationPageState extends State<ProductOrganizationPage> {
  final ProductOrganizationViewModel _viewModel =
      getIt<ProductOrganizationViewModel>();

  @override
  void initState() {
    _viewModel.init(widget.productId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SheetHeader(
            title: "Edit Organization",
            onTap: () => GoRouter.of(context).pop(),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ShadSelectFormField<String>(
                      id: 'type',
                      minWidth: double.infinity,
                      label: const Text('Type'),
                      initialValue: "",
                      onChanged: (status) {},
                      options: []
                          .map(
                            (status) => ShadOption(
                              value: status,
                              child: Text(status.name),
                            ),
                          )
                          .toList(),
                      selectedOptionBuilder: (context, value) => const Text(""),
                    ),
                    const SizedBox(height: 16),
                    const OptionalLabel(label: "Collection"),
                    const SizedBox(height: 8),
                    ShadSelect.raw(
                      variant: ShadSelectVariant.primary,
                      minWidth: double.infinity,
                      initialValue:
                          _viewModel.product.watch(context).collection,
                      onChanged: (collection) {
                        _viewModel.onCollectionChanged(collection);
                      },
                      options: _viewModel.collections
                          .watch(context)
                          .map(
                            (collection) => ShadOption(
                              value: collection,
                              child: Text(collection.title),
                            ),
                          )
                          .toList(),
                      selectedOptionBuilder: (context, value) =>
                          Text(value.title),
                    ),
                    const SizedBox(height: 16),
                    const OptionalLabel(label: "Categories"),
                    const SizedBox(height: 8),
                    ShadSelect<Category>.multiple(
                      minWidth: double.infinity,
                      placeholder: const Text(''),
                      closeOnSelect: false,
                      closeOnTapOutside: true,
                      allowDeselection: true,
                      initialValues:
                          _viewModel.product.watch(context).categories,
                      onChanged: _viewModel.onCategoriesChanged,
                      options: _viewModel.categories
                          .watch(context)
                          .map(
                            (category) => ShadOption(
                              value: category,
                              child: Text(category.name),
                            ),
                          )
                          .toList(),
                      selectedOptionsBuilder: (context, values) => Text(
                        values.map((v) => v.name.capitalize()).join(', '),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ShadSelectFormField<String>(
                      id: 'tags',
                      minWidth: double.infinity,
                      label: const Text('Tags'),
                      initialValue: "",
                      onChanged: (status) {},
                      options: []
                          .map(
                            (status) => ShadOption(
                              value: status,
                              child: Text(status.name),
                            ),
                          )
                          .toList(),
                      selectedOptionBuilder: (context, value) => const Text(""),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SheetFooter(
            onSave: () async {
              _viewModel.onSave(
                () {
                  context.success("Product updated successfully");
                  GoRouter.of(context).pop(true);
                },
                () => context.error("Failed to update product"),
              );
            },
            onCancel: () => GoRouter.of(context).pop(false),
          )
        ],
      ),
    );
  }
}
