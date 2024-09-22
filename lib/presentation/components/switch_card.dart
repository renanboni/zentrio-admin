import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SwitchCard extends StatelessWidget {
  final String title;
  final String? description;
  final bool value;
  final ValueChanged<bool>? onChanged;

  const SwitchCard({
    super.key,
    this.onChanged,
    required this.title,
    this.description,
    this.value = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ShadCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ShadSwitch(
            value: value,
            onChanged: onChanged,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.small,
                ),
                const SizedBox(height: 2),
                if (description != null)
                  Text(
                    description!,
                    style: theme.textTheme.muted,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
