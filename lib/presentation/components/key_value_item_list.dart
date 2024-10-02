import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:tuple/tuple.dart';
import 'package:zentrio_admin/presentation/features/category/components/products_card.dart';

class KeyValueItemList extends StatelessWidget {
  final Tuple2 pair;
  final List<Widget> children;

  const KeyValueItemList({
    super.key,
    required this.pair,
    this.children = const [],
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Padding(
      padding: 16.paddingAll(),
      child: Row(
        children: [
          Expanded(
            child: Text(
              pair.item1.toString(),
              style: theme.textTheme.muted,
            ),
          ),
          Expanded(
            child: children.isEmpty
                ? Text(
                    pair.item2.toString().isEmpty ? '-' : pair.item2.toString(),
                    style: theme.textTheme.muted,
                  )
                : Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    children: children,
                  ),
          ),
        ],
      ),
    );
  }
}
