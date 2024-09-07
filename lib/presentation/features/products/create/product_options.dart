import 'package:flutter/cupertino.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/domain/models/product_option.dart';
import 'package:zentrio_admin/presentation/features/products/create/product_option_list_item.dart';

class ProductOptions extends StatefulWidget {
  const ProductOptions({super.key});

  @override
  State<ProductOptions> createState() => _ProductOptionsState();
}

class _ProductOptionsState extends State<ProductOptions> {
  final _options = signal<List<ProductOption>>(
    [ProductOption.empty()],
  );

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Column(
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Product options",
                  style: theme.textTheme.small,
                ),
                Text(
                  "Define the options for the product, e.g. color, size, etc.",
                  style: theme.textTheme.muted,
                ),
              ],
            ),
            const Spacer(),
            ShadButton.outline(
              size: ShadButtonSize.sm,
              onPressed: () {
                _options.value = [
                  ..._options.value,
                  ProductOption.empty(),
                ];
              },
              child: const Text("Add"),
            )
          ],
        ),
        const SizedBox(height: 16),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _options.watch(context).length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final option = _options.watch(context)[index];

            return ProductOptionListItem(
              enabled: index != 0,
              onRemove: () {
                _options.value = [
                  ..._options.value..removeAt(index),
                ];
              },
            );
          },
        ),
      ],
    );
  }
}
