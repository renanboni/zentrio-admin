import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/presentation/components/stepper/step_status.dart';

enum HorizontalStepState {
  editing,
  completed,
  disabled,
}

@immutable
class StepItemList {
  final Widget content;
  final String title;
  final double width;
  final HorizontalStepState state;

  const StepItemList({
    this.width = 160,
    this.state = HorizontalStepState.editing,
    required this.content,
    required this.title,
  });
}

class StepItemListView extends StatelessWidget {
  final StepItemList step;

  const StepItemListView({
    super.key,
    required this.step,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: step.width,
      child: Row(
        children: [
          const SizedBox(width: 16),
          StepStatus(state: step.state),
          const SizedBox(width: 8),
          Text(
            step.title,
            style: ShadTheme.of(context)
                .textTheme
                .small
                .copyWith(fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          const VerticalDivider(width: 1),
        ],
      ),
    );
  }
}
