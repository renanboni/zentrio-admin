import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ItemStatus extends StatelessWidget {
  final bool isActive;
  final String activeText;
  final String inactiveText;

  const ItemStatus({
    super.key,
    required this.isActive,
    required this.activeText,
    required this.inactiveText,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ShadBadge.outline(
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: isActive ? Colors.green : Colors.red,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            isActive ? activeText : inactiveText,
            style: theme.textTheme.muted,
          ),
        ],
      ),
    );
  }
}
