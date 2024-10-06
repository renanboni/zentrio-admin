import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/utils/extensions/sizes_ext.dart';

class ActionItemList extends StatelessWidget {
  final String title;
  final String label;
  final VoidCallback? onTap;

  const ActionItemList({
    super.key,
    required this.title,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ShadCard(
      padding: 12.paddingAll(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: theme.textTheme.table,
          ),
          const SizedBox(width: 12),
          ShadBadge.secondary(child: Text(label)),
          const Spacer(),
          IconButton(
            onPressed: onTap,
            iconSize: 16,
            padding: EdgeInsets.zero,
            icon: const Icon(
              LucideIcons.externalLink,
            ),
            color: theme.colorScheme.ring,
          ),
        ],
      ),
    );
  }
}
