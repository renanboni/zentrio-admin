import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class EscButton extends StatelessWidget {
  const EscButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: const Row(
        children: [
          SizedBox(width: 20),
          Icon(
            Icons.close,
            color: Colors.grey,
            size: 16,
          ),
          SizedBox(width: 8),
          ShadBadge(
            child: Text('esc'),
          ),
          SizedBox(width: 20),
          VerticalDivider(width: 1),
        ],
      ),
    );
  }
}
