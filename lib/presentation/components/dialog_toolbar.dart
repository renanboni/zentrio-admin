import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zentrio_admin/presentation/components/stepper/esc_button.dart';

class DialogToolbar extends StatelessWidget {
  const DialogToolbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 4),
        EscButton(onTap: () => GoRouter.of(context).pop()),
        const SizedBox(height: 4),
        const Divider(height: 1,)
      ],
    );
  }
}
