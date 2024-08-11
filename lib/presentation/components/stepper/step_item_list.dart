import 'package:flutter/material.dart';

class StepItemList extends StatefulWidget {
  final Widget content;
  final String title;

  const StepItemList({
    super.key,
    required this.content,
    required this.title,
  });

  @override
  State<StepItemList> createState() => _StepItemListState();
}

class _StepItemListState extends State<StepItemList> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Text(widget.title),
          ),
          const VerticalDivider(width: 1),
        ],
      ),
    );
  }
}
