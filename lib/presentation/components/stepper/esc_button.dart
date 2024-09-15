import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class EscButton extends StatelessWidget {
  final VoidCallback onTap;

  const EscButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 20),
        IconButton(
          onPressed: onTap,
          icon: const Icon(
            Icons.close,
            color: Colors.grey,
            size: 16,
          ),
        ),
        const ShadBadge(
          child: Text('esc'),
        ),
        const SizedBox(width: 20),
        const VerticalDivider(width: 1),
      ],
    );
  }
}
