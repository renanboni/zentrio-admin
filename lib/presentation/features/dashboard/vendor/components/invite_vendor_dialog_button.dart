import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class InviteVendorDialogButton extends StatelessWidget {
  const InviteVendorDialogButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadButton(
      child: const Text('Create invite'),
      onPressed: () {
        showShadDialog(
          context: context,
          builder: (context) => ShadDialog(
            title: const Text('Invite'),
            description: const Text(
              "Send an invite to a vendor to join your organization.",
            ),
            actions: const [ShadButton(child: Text('Invite'))],
            child: Container(
              width: 375,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: const ShadInput(
                initialValue: "",
                placeholder: Text("Email"),
              ),
            ),
          ),
        );
      },
    );
  }
}
