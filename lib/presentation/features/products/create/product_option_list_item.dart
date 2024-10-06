import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/domain/models/product_option_value.dart';
import 'package:zentrio_admin/presentation/components/inputChip/chips_input.dart';
import 'package:zentrio_admin/presentation/components/inputChip/input_chip.dart';

class ProductOptionListItem extends StatefulWidget {
  final bool enabled;
  final VoidCallback? onRemove;
  final ValueChanged<String>? onTitleChanged;
  final ValueChanged<List<ProductOptionValue>>? onValuesChanged;

  const ProductOptionListItem({
    super.key,
    this.onRemove,
    required this.enabled,
    this.onTitleChanged,
    this.onValuesChanged,
  });

  @override
  State<ProductOptionListItem> createState() => _ProductOptionListItemState();
}

class _ProductOptionListItemState extends State<ProductOptionListItem> {
  final _values = signal<List<ProductOptionValue>>([]);

  @override
  void initState() {
    computed(() {
      widget.onValuesChanged?.call(_values.value);
    });
    super.initState();
  }

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
                        onChanged: (value) {
                          widget.onTitleChanged?.call(value);
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
                      child: Watch(
                        (_) => ChipsInput(
                          placeholder: "Red, Green, Blue",
                          values: _values.value,
                          onChanged: (values) {
                            _values.value = values;
                          },
                          onTextChanged: (value) {
                          /*  if (value.contains(",")) {
                              _values.value = [
                                ..._values.value,
                                value.replaceAll(",", "")
                              ];
                            }*/
                          },
                          onSubmitted: (value) {
                            // _values.value = [..._values.value, "value"];
                          },
                          chipBuilder: (context, data) {
                            return TextInputChip(
                              label: "data",
                              onDeleted: (value) {
                                _values.value = _values.value
                                    .where((v) => v != value)
                                    .toList();
                              },
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          ShadButton.ghost(
            onPressed: widget.onRemove,
            size: ShadButtonSize.sm,
            enabled: widget.enabled,
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
