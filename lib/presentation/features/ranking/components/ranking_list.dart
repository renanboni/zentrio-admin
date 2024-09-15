import 'package:flutter/material.dart';
import 'package:zentrio_admin/domain/models/category.dart';
import 'package:zentrio_admin/presentation/features/ranking/components/ranking_item_list.dart';

class RankingList extends StatelessWidget {
  final List<Category> categories;

  const RankingList({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return ReorderableListView.builder(
      buildDefaultDragHandles: false,
      itemBuilder: (context, index) {
        final Category category = categories[index];
        return Column(
          key: ValueKey(category.id),
          children: [
            ReorderableDragStartListener(
              index: index,
              child: RankingItemList(
                category: category,
              ),
            ),
            if (index < categories.length - 1) const Divider(height: 1),
          ],
        );
      },
      itemCount: categories.length,
      onReorder: (oldIndex, newIndex) {},
    );
  }
}
