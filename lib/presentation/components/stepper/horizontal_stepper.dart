import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/presentation/components/stepper/esc_button.dart';
import 'package:zentrio_admin/presentation/components/stepper/step_item_list.dart';
import 'package:zentrio_admin/presentation/components/stepper/step_status.dart';
import 'package:zentrio_admin/presentation/components/stepper/stepper_controls.dart';

class HorizontalStepper extends StatefulWidget {
  final List<StepItemList> steps;
  final int currentStep;
  final bool showEsc;
  final ValueChanged<int>? onStepTapped;
  final VoidCallback onComplete;
  final VoidCallback? onEsc;

  const HorizontalStepper({
    super.key,
    this.currentStep = 0,
    this.showEsc = false,
    this.onStepTapped,
    this.onEsc,
    required this.steps,
    required this.onComplete,
  });

  @override
  State<HorizontalStepper> createState() => _StepperState();
}

class _StepperState extends State<HorizontalStepper> {
  final Signal _currentIndex = signal(0);

  final List<GlobalKey<ShadFormState>?> _formKeys = [];
  late List<GlobalKey> _keys;

  @override
  void initState() {
    super.initState();
    _formKeys.addAll(
      List.generate(
        widget.steps.length,
        (index) => GlobalKey<ShadFormState>(),
      ),
    );
    _keys = List<GlobalKey>.generate(
      widget.steps.length,
      (int i) => GlobalKey(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return Column(
      children: [
        SizedBox(
          height: 56,
          child: Row(
            children: [
              if (widget.showEsc) EscButton(onTap: widget.onEsc ?? () {}),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (var i = 0; i < widget.steps.length; i++) ...[
                      Watch(
                        (context) => InkWell(
                          onTap: widget.steps[i].state == HorizontalStepState.disabled
                              ? () => _validateStep()
                              : () => _currentIndex.value = i,
                          child: Container(
                            color: widget.steps[i].state == HorizontalStepState.disabled
                                ? theme.colorScheme.primaryForeground
                                : theme.ghostButtonTheme.backgroundColor,
                            width: widget.steps[i].width,
                            child: Row(
                              children: [
                                const SizedBox(width: 16),
                                StepStatus(state: _getState(i)),
                                const SizedBox(width: 8),
                                Text(
                                  widget.steps[i].title,
                                  style: ShadTheme.of(context)
                                      .textTheme
                                      .small
                                      .copyWith(fontWeight: FontWeight.w500),
                                ),
                                const Spacer(),
                                const VerticalDivider(width: 1),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 1),
        Expanded(
          key: _keys[_currentIndex.value],
          child: Watch(
            (context) => ShadForm(
              key: _formKeys[_currentIndex.value],
              child: widget.steps[_currentIndex.value].content,
            ),
          ),
        ),
        const Divider(height: 1),
        StepperControls(
          onCancel: () {
            GoRouter.of(context).pop();
          },
          onContinue: () {
            if (_formKeys[_currentIndex.value]
                    ?.currentState
                    ?.saveAndValidate() ==
                true) {
              final nextIndex = _currentIndex.value + 1;

              if (nextIndex < widget.steps.length) {
                _currentIndex.value = nextIndex;
              } else {
                widget.onComplete();
              }
            }
          },
        )
      ],
    );
  }

  _validateStep() {
    final isValid = _formKeys[_currentIndex.value]?.currentState?.validate();
    if (isValid == true) {
      _currentIndex.value = _currentIndex.value + 1;
    }
  }

  HorizontalStepState _getState(int i) {
    return _currentIndex.value > i
        ? HorizontalStepState.completed
        : (i == _currentIndex.value
            ? HorizontalStepState.editing
            : HorizontalStepState.disabled);
  }
}
