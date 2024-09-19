import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SheetFooter extends StatelessWidget {
  final void Function() onSave;
  final void Function() onCancel;

  const SheetFooter({
    super.key,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(height: 1),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              const Spacer(),
              ShadButton.outline(
                size: ShadButtonSize.sm,
                onPressed: onCancel,
                child: const Text('Cancel'),
              ),
              const SizedBox(width: 16),
              ShadButton(
                size: ShadButtonSize.sm,
                onPressed: onSave,
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
