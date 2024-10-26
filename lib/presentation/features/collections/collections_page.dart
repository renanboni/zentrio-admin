import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/di/init.dart';
import 'package:zentrio_admin/presentation/components/card_scaffold.dart';
import 'package:zentrio_admin/presentation/features/collections/collections_view_model.dart';
import 'package:zentrio_admin/utils/extensions/localization_ext.dart';

import '../../components/data_table_view.dart';
import '../../components/edit_context_menu.dart';

class CollectionsPage extends StatefulWidget {
  const CollectionsPage({super.key});

  @override
  State<CollectionsPage> createState() => _CollectionsPageState();
}

class _CollectionsPageState extends State<CollectionsPage> {
  final CollectionsViewModel viewModel = getIt<CollectionsViewModel>();

  @override
  Widget build(BuildContext context) {
    return CardScaffold(
      title: context.loc.collections,
      subtitle: context.loc.organizeProductsLabel,
      child: Expanded(
        child: Column(
          children: [
            const Divider(height: 1),
            Watch(
              (_) => Expanded(
                child: DataTableView(
                  onRowTap: (collection) {
                    GoRouter.of(context).go("/collections/${collection.id}");
                  },
                  columns: [
                    context.loc.title,
                    context.loc.handle,
                    context.loc.products,
                    "",
                  ],
                  data: viewModel.collections.value.data,
                  cellBuilder: (collection) => [
                    DataCell(Text(collection.title)),
                    DataCell(Text(collection.handle)),
                    DataCell(Text(collection.products.length.toString())),
                    DataCell(
                      Align(
                        alignment: Alignment.centerRight,
                        child: EditContextMenu(
                          deleteDialogTitle: context.loc.areYouSure,
                          deleteDialogDescription:
                              "You are about to delete the collection ${collection.title}. This action cannot be undone.",
                          onEdit: () => {
                            GoRouter.of(context)
                                .go("/collections/${collection.id}/edit")
                          },
                          onDelete: () => {
                         /*   viewModel.deleteCategory(collection, () {
                              context.success("Category deleted successfully");
                              GoRouter.of(context).pop();
                            }, () {
                              context.error("Failed to delete collection");
                            })*/
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
