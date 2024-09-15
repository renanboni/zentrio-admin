import 'package:flutter/material.dart';

class CategoryVisibility extends StatelessWidget {
  final bool isInternal;

  const CategoryVisibility({
    super.key,
    required this.isInternal,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: isInternal ? Colors.red : Colors.green,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 8),
        Text(isInternal ? 'Internal' : 'Public'),
      ],
    );
  }
}
