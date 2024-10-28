import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TitleHeading extends StatelessWidget {
  final String title;
  final String? description;
  final Widget? label;

  const TitleHeading({
    super.key,
    required this.title,
    this.description,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: theme.textTheme.h4,
            ),
            if (label != null) ...[
              const SizedBox(width: 8),
              label!,
            ],
          ],
        ),
        if (description != null) ...[
          const SizedBox(height: 2),
          Text(
            description!,
            style: theme.textTheme.muted,
          ),
        ],
      ],
    );
  }
}
