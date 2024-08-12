import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/presentation/components/stepper/esc_button.dart';
import 'package:zentrio_admin/presentation/components/stepper/step_item_list.dart';
import 'package:zentrio_admin/presentation/components/stepper/stepper_controls.dart';

class HorizontalStepper extends StatefulWidget {
  final List<StepItemList> steps;
  final int currentStep;
  final bool showEsc;
  final ValueChanged<int>? onStepTapped;
  final VoidCallback onContinue;

  const HorizontalStepper({
    super.key,
    this.currentStep = 0,
    this.showEsc = false,
    this.onStepTapped,
    required this.steps,
    required this.onContinue,
  });

  @override
  State<HorizontalStepper> createState() => _StepperState();
}

class _StepperState extends State<HorizontalStepper> {

  final Signal _currentIndex = signal(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 56,
          child: Row(
            children: [
              if (widget.showEsc) const EscButton(),
              for (var i = 0; i < widget.steps.length; i++) ...[
                InkWell(
                  onTap: widget.steps[i].state == HorizontalStepState.disabled
                      ? null
                      : () => widget.onStepTapped?.call(i),
                  child: widget.steps[i],
                ),
              ]
            ],
          ),
        ),
        const Divider(height: 1),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: ShadForm(
              key: widget.steps[widget.currentStep].formKey,
              child: widget.steps[widget.currentStep].content,
            ),
          ),
        ),
        const Divider(height: 1),
        StepperControls(
          onCancel: () {
            GoRouter.of(context).pop();
          },
          onContinue: () {
            if (widget.steps[widget.currentStep].formKey?.currentState
                ?.saveAndValidate() == true) {
              // widget.steps[_currentIndex.value].state = HorizontalStepState.completed;
            }
          },
        )
      ],
    );
  }
}
