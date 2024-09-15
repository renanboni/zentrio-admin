import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CategoryStatus extends StatelessWidget {
  final bool isActive;

  const CategoryStatus({
    super.key,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: isActive ? Colors.green : Colors.red,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          isActive ? 'Active' : 'Inactive',
          style: theme.textTheme.small,
        ),
      ],
    );
  }
}
