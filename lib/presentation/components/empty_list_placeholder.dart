
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/utils/extensions/sizes_ext.dart';

class EmptyListPlaceholder extends StatelessWidget {
  const EmptyListPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Padding(
      padding: 128.paddingVertical(),
      child: Column(
        children: [
          const ShadImage(
            LucideIcons.circleAlert,
            width: 16,
            height: 16,
          ),
          const SizedBox(height: 12),
          Text(
            "No records",
            style: theme.textTheme.small,
          ),
          const SizedBox(height: 4),
          Text(
            "There are no products in the category.",
            style: theme.textTheme.muted,
          ),
        ],
      ),
    );
  }
}
