import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class DialogHeader extends StatelessWidget {
  final void Function() onTap;

  const DialogHeader({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
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
            ],
          ),
        ),
        const Divider(height: 1)
      ],
    );
  }
}
