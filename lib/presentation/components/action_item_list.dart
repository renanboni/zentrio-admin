import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/presentation/components/key_value_item_list.dart';

class ActionItemList extends StatelessWidget {
  final String title;
  final String label;

  const ActionItemList({
    super.key,
    required this.title,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ShadCard(
      padding: 16.paddingAll(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: theme.textTheme.table,
          ),
          const SizedBox(width: 8),
          ShadBadge.secondary(child: Text(label)),
          const Spacer(),
          InkWell(
            onTap: () => {},
            child: Icon(
              LucideIcons.externalLink,
              size: 16,
              color: theme.colorScheme.ring,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
