import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
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
        ShadCard(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ShadSwitch(
                value: _showProductOptions.watch(context),
                onChanged: (value) {
                  _showProductOptions.value = value;
                },
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Yes, this is a product with variants",
                    style: theme.textTheme.small,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "When unchecked, we will create a default variant for you",
                    style: theme.textTheme.muted,
                  ),
                ],
              )
            ],
          ),
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
