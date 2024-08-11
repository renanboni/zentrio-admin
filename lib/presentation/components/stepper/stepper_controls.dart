
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class StepperControls extends StatelessWidget {
  const StepperControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ShadButton.outline(
            onPressed: () {},
            size: ShadButtonSize.sm,
            child: const Text('Cancel'),
          ),
          const SizedBox(width: 4),
          ShadButton(
            onPressed: () {},
            size: ShadButtonSize.sm,
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }
}
