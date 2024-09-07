import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ProductOptionListItem extends StatelessWidget {
  final bool enabled;
  final VoidCallback? onRemove;

  const ProductOptionListItem({
    super.key,
    this.onRemove,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ShadCard(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 64,
                      child: Text(
                        "Title",
                        style: theme.textTheme.small,
                      ),
                    ),
                    const Expanded(
                      child: ShadInput(
                        placeholder: Text("Color"),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    SizedBox(
                      width: 64,
                      child: Text(
                        "Values",
                        style: theme.textTheme.small,
                      ),
                    ),
                    const Expanded(
                      child: ShadInput(
                        placeholder: Text("Red, Green, Blue"),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          ShadButton.ghost(
            onPressed: onRemove,
            size: ShadButtonSize.sm,
            enabled: enabled,
            icon: const ShadImage.square(
              size: 16,
              LucideIcons.x,
            ),
          )
        ],
      ),
    );
  }
}
