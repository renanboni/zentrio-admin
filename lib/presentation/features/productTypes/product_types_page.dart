import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/di/init.dart';
import 'package:zentrio_admin/presentation/components/card_scaffold.dart';
import 'package:zentrio_admin/presentation/components/empty_list_placeholder.dart';
import 'package:zentrio_admin/presentation/features/banners/banners_page.dart';
import 'package:zentrio_admin/presentation/features/productTypes/components/product_types_table.dart';
import 'package:zentrio_admin/presentation/features/productTypes/product_types_view_model.dart';
import 'package:zentrio_admin/utils/extensions/context_ext.dart';

class ProductTypesPage extends StatefulWidget {
  const ProductTypesPage({super.key});

  @override
  State<ProductTypesPage> createState() => _ProductTypesPageState();
}

class _ProductTypesPageState extends State<ProductTypesPage> {
  final ProductTypesViewModel viewModel = getIt<ProductTypesViewModel>();

  @override
  Widget build(BuildContext context) {
    return CardScaffold(
      title: "Product Types",
      subtitle: "Organize your products into types.",
      trailing: ShadButton(
        size: ShadButtonSize.sm,
        child: const Text('Create'),
        onPressed: () async {
          final result =
              await GoRouter.of(context).push("/product_types/create");
          if (result == true) {
            viewModel.refresh();
          }
        },
      ),
      child: Column(
        children: [
          const Divider(
            height: 1,
          ),
          Expanded(
            child: Watch(
              (_) {
                if (viewModel.productTypes.isEmpty) {
                  const EmptyListPlaceholder();
                }
                return ProductTypesTable(
                  productTypes: viewModel.productTypes,
                  onClick: (productType) {
                    GoRouter.of(context).push("/product_types/${productType.id}");
                  },
                  onEdit: (productType) {
                    GoRouter.of(context).go(
                      "/product_types/${productType.id}/edit",
                      extra: productType,
                    );
                  },
                  onDelete: (productType) {
                    viewModel.onDeleted(
                      productType,
                      () {
                        GoRouter.of(context).pop();
                        context.success("Product type deleted successfully");
                      },
                      () => context.error("Failed to delete product type"),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
