import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/domain/models/product_option.dart';
import 'package:zentrio_admin/domain/models/product_option_value.dart';
import 'package:zentrio_admin/presentation/components/inputChip/chips_input.dart';
import 'package:zentrio_admin/presentation/components/inputChip/input_chip.dart';

class ProductOptionListItem extends StatelessWidget {
  final bool enabled;
  final ProductOption productOption;
  final VoidCallback? onRemove;
  final ValueChanged<String>? onTitleChanged;
  final ValueChanged<List<ProductOptionValue>>? onValuesChanged;
  final ValueChanged<String> onValueRemoved;

  const ProductOptionListItem({
    super.key,
    required this.enabled,
    required this.productOption,
    required this.onValueRemoved,
    this.onRemove,
    this.onTitleChanged,
    this.onValuesChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ShadCard(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 64,
                      child: Text(
                        "Title",
                        style: theme.textTheme.small,
                      ),
                    ),
                    Expanded(
                      child: ShadInput(
                        placeholder: const Text("Color"),
                        initialValue: productOption.title,
                        onChanged: (value) {
                          onTitleChanged?.call(value);
                        },
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    SizedBox(
                      width: 64,
                      child: Text(
                        "Values",
                        style: theme.textTheme.small,
                      ),
                    ),
                    Expanded(
                      child: ChipsInput(
                        placeholder: "Red, Green, Blue",
                        values: productOption.values,
                        onChanged: (values) {
                          //onValuesChanged?.call(values);
                        },
                        onTextChanged: (value) {
                          if (value.contains(",")) {
                            final newValues = value
                                .split(",")
                                .where((v) => v.isNotEmpty)
                                .map((v) => ProductOptionValue(value: v))
                                .toList();

                            final currentValues = productOption.values;

                            if (currentValues.isEmpty) {
                              onValuesChanged?.call(newValues);
                            } else {
                              onValuesChanged?.call([...currentValues, ...newValues]);
                            }
                          }
                        },
                        onSubmitted: (value) {
                          final newValues = value
                              .split(",")
                              .where((v) => v.isNotEmpty)
                              .map((v) => ProductOptionValue(value: v))
                              .toList();

                          final currentValues = productOption.values;

                          if (currentValues.isEmpty) {
                            onValuesChanged?.call(newValues);
                          } else {
                            onValuesChanged?.call([...currentValues, ...newValues]);
                          }
                        },
                        chipBuilder: (context, data) {
                          return TextInputChip(
                            label: data.value,
                            onDeleted: onValueRemoved,
                          );
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          ShadButton.ghost(
            onPressed: onRemove,
            size: ShadButtonSize.sm,
            enabled: enabled,
            icon: const ShadImage.square(
              size: 16,
              LucideIcons.x,
            ),
          )
        ],
      ),
    );
  }
}
