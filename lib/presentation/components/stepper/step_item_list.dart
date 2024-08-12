import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/presentation/components/stepper/step_status.dart';

enum HorizontalStepState {
  editing,
  completed,
  disabled,
}

class StepItemList extends StatefulWidget {
  final Widget content;
  final String title;
  final double width;
  final HorizontalStepState state;
  final GlobalKey<ShadFormState>? formKey;

  const StepItemList({
    super.key,
    this.width = 160,
    this.state = HorizontalStepState.editing,
    required this.content,
    required this.title,
    this.formKey,
  });

  @override
  State<StepItemList> createState() => _StepItemListState();
}

class _StepItemListState extends State<StepItemList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Row(
        children: [
          const SizedBox(width: 16),
          StepStatus(state: widget.state),
          const SizedBox(width: 8),
          Text(
            widget.title,
            style: ShadTheme.of(context).textTheme.small.copyWith(
              fontWeight: FontWeight.w500
            ),
          ),
          const Spacer(),
          const VerticalDivider(width: 1),
        ],
      ),
    );
  }
}
