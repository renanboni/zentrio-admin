import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/presentation/components/stepper/esc_button.dart';

class SheetHeader extends StatelessWidget {
  final String title;
  final void Function() onTap;

  const SheetHeader({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              const SizedBox(width: 8),
              Text(
                title,
                style: theme.textTheme.lead.copyWith(
                  color: theme.textTheme.h1Large.color,
                ),
              ),
              const Spacer(),
              const ShadBadge(
                child: Text('esc'),
              ),
              IconButton(
                onPressed: onTap,
                icon: const Icon(
                  Icons.close,
                  color: Colors.grey,
                  size: 16,
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 1)
      ],
    );
  }
}
