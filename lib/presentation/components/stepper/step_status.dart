import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:zentrio_admin/presentation/components/stepper/step_disabled_state.dart';
import 'package:zentrio_admin/presentation/components/stepper/step_editing_state.dart';
import 'package:zentrio_admin/presentation/components/stepper/step_item_list.dart';

class StepStatus extends StatelessWidget {
  final HorizontalStepState state;

  const StepStatus({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case HorizontalStepState.editing:
        return const StepEditingState();
      case HorizontalStepState.completed:
         return const StepEditingState();
      case HorizontalStepState.disabled:
         return const StepDisabledState();
    };
  }
}
