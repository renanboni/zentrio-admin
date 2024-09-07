import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/presentation/components/switch_card.dart';
import 'package:zentrio_admin/presentation/features/products/create/product_options.dart';

class Variants extends StatefulWidget {
  const Variants({super.key});

  @override
  State<Variants> createState() => _VariantsState();
}

class _VariantsState extends State<Variants> {
  final _showProductOptions = signal(false);

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
          description: "When unchecked, we will create a default variant for you",
          value: _showProductOptions.watch(context),
          onChanged: (value) {
            _showProductOptions.value = value;
          },
        ),
        const SizedBox(height: 16),
        if (_showProductOptions.watch(context)) const ProductOptions()
      ],
    );
  }

  @override
  void dispose() {
    _showProductOptions.dispose();
    super.dispose();
  }
}
