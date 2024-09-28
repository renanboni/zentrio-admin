import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:tuple/tuple.dart';

class KeyValueItemList extends StatelessWidget {
  final Tuple2 pair;
  final Widget? child;

  const KeyValueItemList({
    super.key,
    required this.pair,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Text(
              pair.item1.toString(),
              style: theme.textTheme.muted,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                child ?? Text(
                  pair.item2.toString().isEmpty ? '-' : pair.item2.toString(),
                  style: theme.textTheme.muted,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
