import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/presentation/components/switch_card.dart';

class Variants extends StatelessWidget {
  final bool showProductOptions;
  final ValueChanged<bool> onChanged;

  const Variants({
    super.key,
    this.showProductOptions = false,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Variants",
          style: theme.textTheme.large,
        ),
        const SizedBox(height: 16),
        SwitchCard(
          title: "Yes, this is a product with variants",
          description:
              "When unchecked, we will create a default variant for you",
          value: showProductOptions,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
