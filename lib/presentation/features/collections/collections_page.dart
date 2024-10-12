import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/di/init.dart';
import 'package:zentrio_admin/main.dart';
import 'package:zentrio_admin/presentation/features/banners/banners_page.dart';
import 'package:zentrio_admin/presentation/features/collections/collections_view_model.dart';
import 'package:zentrio_admin/presentation/features/collections/components/collections_table.dart';
import 'package:zentrio_admin/utils/extensions/context_ext.dart';

class CollectionsPage extends StatefulWidget {
  const CollectionsPage({super.key});

  @override
  State<CollectionsPage> createState() => _CollectionsPageState();
}

class _CollectionsPageState extends State<CollectionsPage> {
  final CollectionsViewModel _viewModel = getIt<CollectionsViewModel>();

  @override
  Widget build(BuildContext context) {
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
              "Collections",
              style: ShadTheme.of(context).textTheme.table,
            ),
            const Spacer(),
            ShadButton(
              size: ShadButtonSize.sm,
              child: const Text('Create'),
              onPressed: () async {
                final result = await GoRouter.of(context).push("/collections/create");
                if (result == true) {
                  _viewModel.refresh();
                }
              },
            )
          ],
        ),
      ),
      child: Expanded(
        child: Column(
          children: [
            const Divider(height: 1),
            Expanded(
              child: CollectionsTable(
                collections: _viewModel.collections.watch(context),
                onClick: (collection) {
                  GoRouter.of(context).go("/collections/${collection.id}");
                },
                onEdit: (collection) {
                  GoRouter.of(context).go("/collections/${collection.id}");
                },
                onDelete: (collection) {
                  _viewModel.deleteCollection(
                    collection.id,
                    () {
                      context.success("Collection deleted successfully");
                      GoRouter.of(context).pop();
                    },
                    () => context.error("Failed to delete collection"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
