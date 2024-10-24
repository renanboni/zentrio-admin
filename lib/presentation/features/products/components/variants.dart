import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/presentation/components/switch_card.dart';
import 'package:zentrio_admin/presentation/features/products/products_page.dart';
import 'package:zentrio_admin/utils/extensions/localization_ext.dart';

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
          context.loc.variants,
          style: theme.textTheme.large,
        ),
        const SizedBox(height: 16),
        SwitchCard(
          title: context.loc.productWithVariantLabel,
          description: context.loc.productWithVariantDescription,
          value: showProductOptions,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
