import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/presentation/features/products/products_view_model.dart';
import 'package:zentrio_admin/utils/extensions/context_ext.dart';
import 'package:zentrio_admin/utils/extensions/localization_ext.dart';

import '../../../di/init.dart';
import '../../components/data_table_view.dart';
import '../../components/edit_context_menu.dart';
import 'components/products_table.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final ProductsViewModel viewModel = getIt<ProductsViewModel>();

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ShadCard(
      padding: const EdgeInsets.all(0),
      title: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.loc.products,
              style: ShadTheme.of(context).textTheme.table,
            ),
            ShadButton(
              child: const Text('Create'),
              onPressed: () {
                GoRouter.of(context).go("/products/create");
              },
            )
          ],
        ),
      ),
      child: Expanded(
        child: Column(
          children: [
            const Divider(height: 1),
            Watch(
              (_) => Expanded(
                child: DataTableView(
                  onRowTap: (product) {
                    GoRouter.of(context).go("/products/${product.id}");
                  },
                  columns: [
                    context.loc.product,
                    context.loc.collection,
                    context.loc.salesChannel,
                    context.loc.variants,
                    context.loc.status,
                    ''
                  ],
                  data: viewModel.products.value.data,
                  cellBuilder: (product) => [
                    DataCell(
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: ShadImage(
                              product.thumbnail,
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              product.title,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  theme.textTheme.small.copyWith(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                    DataCell(Text(
                      product.collection.title,
                      style: theme.textTheme.small.copyWith(fontSize: 12),
                    )),
                    DataCell(Text(
                      product.salesChannels.map((e) => e.name).join(", "),
                      style: theme.textTheme.small.copyWith(fontSize: 12),
                    )),
                    DataCell(Text(
                      context.loc.nVariants(product.variants.length),
                      style: theme.textTheme.small.copyWith(fontSize: 12),
                    )),
                    DataCell(Text(
                      product.status,
                      style: theme.textTheme.small.copyWith(fontSize: 12),
                    )),
                    DataCell(
                      Align(
                        alignment: Alignment.centerRight,
                        child: EditContextMenu(
                          deleteDialogTitle: context.loc.areYouSure,
                          deleteDialogDescription:
                              "You are about to delete the product ${product.title}. This action cannot be undone.",
                          onEdit: () => {
                            GoRouter.of(context)
                                .go("/products/${product.id}/edit")
                          },
                          onDelete: () => {
                            viewModel.onDeleteProduct(product.id, () {
                              context.success("Product deleted successfully");
                              GoRouter.of(context).pop();
                            }, () {
                              context.error("Failed to delete product");
                            })
                          },
                        ),
                      ),
                    ),
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
