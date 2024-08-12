import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class StepperControls extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback? onContinue;
  final bool isContinueEnabled;

  const StepperControls({
    super.key,
    this.isContinueEnabled = true,
    required this.onCancel,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ShadButton.outline(
            onPressed: onCancel,
            size: ShadButtonSize.sm,
            child: const Text('Cancel'),
          ),
          const SizedBox(width: 4),
          ShadButton(
            enabled: isContinueEnabled,
            onPressed: onContinue,
            size: ShadButtonSize.sm,
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }
}
