import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class FormActionLabel extends StatelessWidget {
  final String title;
  final String description;
  final String? cta;
  final VoidCallback? onPressed;

  const FormActionLabel({
    super.key,
    required this.title,
    required this.description,
    this.cta,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.small,
              ),
              Text(
                description,
                style: theme.textTheme.muted,
              ),
            ],
          ),
        ),
        if (cta != null)
          ShadButton.outline(
            size: ShadButtonSize.sm,
            onPressed: onPressed,
            child: Text(cta!),
          )
      ],
    );
  }
}
