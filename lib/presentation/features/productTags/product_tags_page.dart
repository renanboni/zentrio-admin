import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/di/init.dart';
import 'package:zentrio_admin/presentation/components/card_scaffold.dart';
import 'package:zentrio_admin/presentation/features/productTags/product_tags_view_model.dart';
import 'package:zentrio_admin/utils/extensions/context_ext.dart';
import 'package:zentrio_admin/utils/extensions/string_ext.dart';

import '../../components/data_table_view.dart';
import '../../components/edit_context_menu.dart';

class ProductTagsPage extends StatefulWidget {
  const ProductTagsPage({super.key});

  @override
  State<ProductTagsPage> createState() => _ProductTagsPageState();
}

class _ProductTagsPageState extends State<ProductTagsPage> {
  final ProductTagsViewModel viewModel = getIt<ProductTagsViewModel>();

  @override
  Widget build(BuildContext context) {
    return CardScaffold(
      title: "Product Tags",
      subtitle: "Organize your products into tags.",
      trailing: ShadButton(
        size: ShadButtonSize.sm,
        child: const Text('Create'),
        onPressed: () async {
          final result =
              await GoRouter.of(context).push("/product_tags/create");
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
                  onRowTap: (productTag) {
                    GoRouter.of(context).go("/product_tags/${productTag.id}");
                  },
                  columns: const [
                    "Value",
                    "Created",
                    "Updated",
                    "",
                  ],
                  data: viewModel.productTags.value.data,
                  cellBuilder: (productTag) => [
                    DataCell(Text(productTag.value)),
                    DataCell(Text(productTag.createdAt.yMMMd())),
                    DataCell(Text(productTag.updatedAt.yMMMd())),
                    DataCell(
                      Align(
                        alignment: Alignment.centerRight,
                        child: EditContextMenu(
                          deleteDialogTitle: "Are you sure?",
                          deleteDialogDescription:
                              "You are about to delete the product tag ${productTag.value}. This action cannot be undone.",
                          onEdit: () => {
                            GoRouter.of(context)
                                .go("/product_tags/${productTag.id}/edit")
                          },
                          onDelete: () => {
                            viewModel.deleteProductTag(productTag, () {
                              context.success("Tag deleted successfully");
                              GoRouter.of(context).pop();
                            }, () {
                              context.error("Failed to delete tag");
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
