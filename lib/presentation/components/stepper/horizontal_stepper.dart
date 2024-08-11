import 'package:flutter/material.dart';
import 'package:zentrio_admin/presentation/components/stepper/esc_button.dart';
import 'package:zentrio_admin/presentation/components/stepper/step_item_list.dart';
import 'package:zentrio_admin/presentation/components/stepper/stepper_controls.dart';

class HorizontalStepper extends StatefulWidget {
  final List<StepItemList> steps;
  final int currentStep;
  final bool showEsc;
  final ValueChanged<int>? onStepTapped;

  const HorizontalStepper({
    super.key,
    this.currentStep = 0,
    this.showEsc = false,
    this.onStepTapped,
    required this.steps,
  });

  @override
  State<HorizontalStepper> createState() => _StepperState();
}

class _StepperState extends State<HorizontalStepper> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 64,
          child: Row(
            children: [
              if (widget.showEsc) const EscButton(),
              for (var i = 0; i < widget.steps.length; i++) ...[
                InkWell(
                  onTap: () => widget.onStepTapped?.call(i),
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
            child: widget.steps[widget.currentStep].content,
          ),
        ),
        const Divider(height: 1),
        const StepperControls()
      ],
    );
  }
}
