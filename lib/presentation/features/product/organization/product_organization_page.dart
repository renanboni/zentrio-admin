import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/di/init.dart';
import 'package:zentrio_admin/domain/models/collection.dart';
import 'package:zentrio_admin/domain/models/product.dart';
import 'package:zentrio_admin/presentation/features/product/organization/product_organization_view_model.dart';

import '../../../components/sheet_footer.dart';
import '../../../components/sheet_header.dart';

class ProductOrganizationPage extends StatefulWidget {
  final Product product;

  const ProductOrganizationPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductOrganizationPage> createState() => _ProductOrganizationPageState();
}

class _ProductOrganizationPageState extends State<ProductOrganizationPage> {

  final ProductOrganizationViewModel _viewModel = getIt<ProductOrganizationViewModel>();

  @override
  void initState() {
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
                    ShadSelectFormField<Collection>(
                      id: 'collection',
                      minWidth: double.infinity,
                      label: const Text('Collection'),
                      initialValue: Collection.empty(),
                      onChanged: (collection) {},
                      options: _viewModel.collections.watch(context)
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
                    ShadSelectFormField<String>(
                      id: 'categories',
                      minWidth: double.infinity,
                      label: const Text('Categories'),
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
            onSave: () async {},
            onCancel: () => GoRouter.of(context).pop(false),
          )
        ],
      ),
    );
  }
}
