import 'package:flutter/material.dart';
import 'package:zentrio_admin/presentation/components/stepper/step_status.dart';

class StepItemList extends StatefulWidget {
  final Widget content;
  final String title;
  final double width;

  const StepItemList({
    super.key,
    this.width = 160,
    required this.content,
    required this.title,
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
          const StepStatus(),
          const SizedBox(width: 8),
          Text(widget.title),
          const Spacer(),
          const VerticalDivider(width: 1),
        ],
      ),
    );
  }
}
