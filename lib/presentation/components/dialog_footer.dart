import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/utils/extensions/localization_ext.dart';

class DialogFooter extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onCreate;

  const DialogFooter({
    super.key,
    required this.onCancel,
    required this.onCreate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(height: 1),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ShadButton.outline(
                onPressed: onCancel,
                size: ShadButtonSize.sm,
                child: Text(context.loc.cancel),
              ),
              const SizedBox(width: 8),
              ShadButton(
                onPressed: onCreate,
                size: ShadButtonSize.sm,
                child: Text(context.loc.create),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
