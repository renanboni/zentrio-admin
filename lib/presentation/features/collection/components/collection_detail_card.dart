import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:tuple/tuple.dart';
import 'package:zentrio_admin/domain/models/collection.dart';
import 'package:zentrio_admin/utils/extensions/localization_ext.dart';

import '../../../components/edit_context_menu.dart';
import '../../../components/key_value_item_list.dart';

class CollectionDetailCard extends StatelessWidget {
  final Collection collection;
  final VoidCallback onRefresh;

  const CollectionDetailCard({
    super.key,
    required this.collection,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          _buildHeader(context, collection),
          const Divider(height: 1),
          KeyValueItemList(pair: Tuple2(context.loc.handle, collection.handle)),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, Collection collection) {
    final theme = ShadTheme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(
        children: [
          Text(
            collection.title,
            style: theme.textTheme.table,
          ),
          const Spacer(),
          Wrap(
            direction: Axis.horizontal,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 16,
            children: [
              EditContextMenu(
                deleteDialogTitle: "Are you sure?",
                deleteDialogDescription:
                    "You are about to delete the ${collection.title}. This action cannot be undone.",
                onEdit: () async {
                  final result = await GoRouter.of(context).push(
                    "/collection/${collection.id}/edit",
                    extra: collection,
                  );

                  if (result == true) {
                    onRefresh();
                  }
                },
                onDelete: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}
