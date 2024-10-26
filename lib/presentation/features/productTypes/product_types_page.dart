import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/di/init.dart';
import 'package:zentrio_admin/presentation/components/card_scaffold.dart';
import 'package:zentrio_admin/presentation/features/productTypes/product_types_view_model.dart';
import 'package:zentrio_admin/utils/extensions/context_ext.dart';
import 'package:zentrio_admin/utils/extensions/localization_ext.dart';
import 'package:zentrio_admin/utils/extensions/string_ext.dart';

import '../../components/data_table_view.dart';
import '../../components/edit_context_menu.dart';

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
      title: context.loc.productTypes,
      subtitle: context.loc.productTypesDescription,
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
      child: Expanded(
        child: Column(
          children: [
            const Divider(height: 1),
            Watch(
              (_) => Expanded(
                child: DataTableView(
                  onRowTap: (productType) {
                    GoRouter.of(context).go("/product_types/${productType.id}");
                  },
                  columns: const [
                    "Value",
                    "Created",
                    "Updated",
                    "",
                  ],
                  data: viewModel.productTypes.value.data,
                  cellBuilder: (productType) => [
                    DataCell(Text(productType.value)),
                    DataCell(Text(productType.createdAt.yMMMd())),
                    DataCell(Text(productType.updatedAt.yMMMd())),
                    DataCell(
                      Align(
                        alignment: Alignment.centerRight,
                        child: EditContextMenu(
                          deleteDialogTitle: "Are you sure?",
                          deleteDialogDescription:
                              "You are about to delete the product type ${productType.value}. This action cannot be undone.",
                          onEdit: () => {
                            GoRouter.of(context)
                                .go("/product_types/${productType.id}/edit")
                          },
                          onDelete: () => {
                            viewModel.onDeleted(productType, () {
                              context.success("Type deleted successfully");
                              GoRouter.of(context).pop();
                            }, () {
                              context.error("Failed to delete type");
                            })
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
