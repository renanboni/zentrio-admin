import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/domain/models/category.dart';

class RankingItemList extends StatelessWidget {
  final Category category;

  const RankingItemList({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return InkWell(
      mouseCursor: SystemMouseCursors.click,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(
              LucideIcons.gripVertical,
              size: 16,
              color: theme.colorScheme.ring,
            ),
            const SizedBox(width: 36),
            Icon(
              LucideIcons.tag,
              size: 16,
              color: theme.colorScheme.ring,
            ),
            const SizedBox(width: 8),
            Text(
              category.name,
              style: theme.textTheme.muted,
            ),
          ],
        ),
      ),
    );
  }
}
