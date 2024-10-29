import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/domain/models/category.dart';

class CategoriesRank extends StatefulWidget {
  final List<Category> categories;
  final String newCategoryName;
  final ValueChanged<List<Category>> onRankChanged;

  const CategoriesRank({
    super.key,
    required this.categories,
    required this.newCategoryName,
    required this.onRankChanged,
  });

  @override
  State<CategoriesRank> createState() => _CategoriesRankState();
}

class _CategoriesRankState extends State<CategoriesRank> {
  late List<Category> _categories;

  @override
  void initState() {
    _categories = widget.categories;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Column(
      children: [
        const SizedBox(height: 32),
        Expanded(
          child: ReorderableListView.builder(
            buildDefaultDragHandles: false,
            itemBuilder: (context, index) {
              return Column(
                key: Key("${_categories[index].rank}-${_categories[index].name}"),
                children: [
                  ReorderableDragStartListener(
                    enabled: _categories[index].isNew,
                    index: index,
                    child: ListTile(
                      mouseCursor: _categories[index].isNew ? SystemMouseCursors.click : null,
                      tileColor: !_categories[index].isNew ? theme.colorScheme.primaryForeground : null,
                      leading: Icon(
                        size: 16,
                        LucideIcons.tags,
                        color: theme.textTheme.muted.color,
                      ),
                      trailing: Icon(
                        size: 16,
                        LucideIcons.gripVertical,
                        color: theme.textTheme.muted.color,
                      ),
                      title: Row(
                        children: [
                          Text(
                            _categories[index].name,
                            style: theme.textTheme.muted,
                          ),
                          if (_categories[index].isNew) const SizedBox(width: 8),
                          if (_categories[index].isNew)
                            const ShadBadge.secondary(
                              child: Text('New'),
                            ),
                        ],
                      ),
                    ),
                  ),
                  if (index < _categories.length - 1) const Divider(height: 1),
                ],
              );
            },
            itemCount: _categories.length,
            onReorder: (oldIndex, newIndex) {
              setState(
                () {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  final Category item = _categories.removeAt(oldIndex);
                  _categories.insert(newIndex, item);
                  widget.onRankChanged(_categories);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
