import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class DetailCard extends StatelessWidget {
  final String title;
  final Widget? child;
  final Widget? trailing;

  const DetailCard({
    super.key,
    required this.title,
    this.child,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          _DetailCardHeader(
            title: title,
            trailing: trailing,
          ),
          if (child != null) const Divider(height: 1),
          if (child != null) child!,
        ],
      ),
    );
  }
}

class _DetailCardHeader extends StatelessWidget {
  final String title;
  final Widget? trailing;

  const _DetailCardHeader({
    required this.title,
    this.trailing,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    final theme = ShadTheme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      child: Row(
        children: [
          Text(
            title,
            style: theme.textTheme.table,
          ),
          const Spacer(),
          Wrap(
            direction: Axis.horizontal,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 16,
            children: [
              trailing ?? const SizedBox(),
            ],
          )
        ],
      ),
    );
  }
}
