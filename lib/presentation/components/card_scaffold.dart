import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CardScaffold extends StatelessWidget {
  final Widget child;
  final Widget? trailing;
  final String title;
  final String subtitle;

  const CardScaffold({
    super.key,
    required this.title,
    required this.child,
    this.trailing,
    this.subtitle = "",
  });

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
              title,
              style: ShadTheme.of(context).textTheme.table,
            ),
            const Spacer(),
            if (trailing != null) trailing!
          ],
        ),
      ),
      child: Expanded(
        child: child,
      ),
    );
  }
}
