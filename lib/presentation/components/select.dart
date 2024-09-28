import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Select<T> extends StatelessWidget {
  final String id;
  final String label;
  final T initialValue;
  final ValueChanged<T?>? onChanged;
  final Iterable<Widget>? options;
  final ShadSelectedOptionBuilder<T> selectedOptionBuilder;

  const Select({
    super.key,
    required this.initialValue,
    required this.id,
    required this.label,
    required this.selectedOptionBuilder,
    this.onChanged,
    this.options,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ShadSelectFormField<T>(
          id: id,
          maxWidth: constraints.maxWidth,
          minWidth: constraints.maxWidth,
          label: Text(label),
          initialValue: initialValue,
          onChanged: onChanged,
          options: options,
          selectedOptionBuilder: selectedOptionBuilder,
        );
      },
    );
  }
}
