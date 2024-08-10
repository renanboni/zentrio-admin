import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class VendorsPage extends StatelessWidget {
  const VendorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      padding: const EdgeInsets.all(0),
      title: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Vendors",
              style: ShadTheme.of(context).textTheme.table,
            ),
            ShadButton(
              size: ShadButtonSize.sm,
              child: const Text("Create"),
              onPressed: () {
                GoRouter.of(context).go('/vendors/create');
              },
            )
          ],
        ),
      ),
      child: const Column(
        children: [
          Divider(
            height: 1,
          )
        ],
      ),
    );
  }
}
