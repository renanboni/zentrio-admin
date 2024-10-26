import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/utils/extensions/localization_ext.dart';

class OptionalLabel extends StatelessWidget {
  final String label;

  const OptionalLabel({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Row(
      children: [
        Text(
          label,
          style: theme.textTheme.small,
        ),
        Text(
          ' (${context.loc.optional})',
          style: theme.textTheme.muted,
        ),
      ],
    );
  }
}
