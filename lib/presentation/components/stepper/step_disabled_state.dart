
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class StepDisabledState extends StatelessWidget {
  const StepDisabledState({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.Circle,
      radius: const Radius.circular(16),
      padding: const EdgeInsets.all(8),
      child: const ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    );
  }
}
