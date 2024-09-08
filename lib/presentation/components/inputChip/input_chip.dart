import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TextInputChip extends StatelessWidget {
  final String label;
  final ValueChanged<String> onDeleted;

  const TextInputChip({
    super.key,
    required this.label,
    required this.onDeleted,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: theme.colorScheme.muted,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: theme.colorScheme.border,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: theme.textTheme.muted,
          ),
          const SizedBox(width: 2),
          InkWell(
            onTap: () => onDeleted(label),
            child: Icon(
              LucideIcons.x,
              size: 16,
              color: theme.colorScheme.ring,
            ),
          )
        ],
      ),
    );
  }
}
