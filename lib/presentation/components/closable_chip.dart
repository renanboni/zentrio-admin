import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/utils/extensions/sizes_ext.dart';

class ClosableChip extends StatelessWidget {
  final String label;
  final Function() onClose;

  const ClosableChip({
    super.key,
    required this.label,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ShadCard(
      padding: 0.paddingAll(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 8),
          Text(
            label,
            style: theme.textTheme.muted,
          ),
          InkWell(
            onTap: onClose,
            child: Container(
              padding: 4.paddingAll(),
              child: Icon(
                Icons.close,
                color: theme.textTheme.muted.color,
                size: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
