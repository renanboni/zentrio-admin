import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TitleHeading extends StatelessWidget {
  final String title;
  final String? description;

  const TitleHeading({
    super.key,
    required this.title,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.h4,
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
