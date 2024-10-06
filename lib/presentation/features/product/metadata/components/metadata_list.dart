import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/domain/models/metadata.dart';
import 'package:zentrio_admin/utils/extensions/sizes_ext.dart';

import 'metadata_list_item.dart';

class MetadataList extends StatelessWidget {
  final List<Metadata> metadata;
  final Function(int) onAddRowAbove;
  final Function(int) onAddRowBelow;
  final Function(int) onDeleteRow;
  final Function(int, String) onKeyChanged;
  final Function(int, String) onValueChanged;

  const MetadataList({
    super.key,
    required this.metadata,
    required this.onAddRowAbove,
    required this.onAddRowBelow,
    required this.onDeleteRow,
    required this.onKeyChanged,
    required this.onValueChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      padding: 0.paddingAll(),
      child: Column(
        children: [
          _buildHeader(context),
          ListView.separated(
            key: Key(metadata.length.toString()),
            shrinkWrap: true,
            itemCount: metadata.length,
            itemBuilder: (context, index) {
              final item = metadata[index];
              return MetadataListItem(
                metadata: item,
                onKeyChanged: (value) => onKeyChanged(index, value),
                onValueChanged: (value) => onValueChanged(index, value),
                onAddRowAbove: () => onAddRowAbove(index),
                onAddRowBelow: () => onAddRowBelow(index),
                onDeleteRow: () => onDeleteRow(index),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(
                height: 1,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Container(
      height: 36,
      color: theme.colorScheme.secondary,
      child: Row(
        children: [
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              "Key",
              style: theme.textTheme.small,
            ),
          ),
          const VerticalDivider(
            width: 2,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              "Value",
              style: theme.textTheme.small,
            ),
          ),
          const VerticalDivider(
            width: 2,
          ),
          const SizedBox(width: 42)
        ],
      ),
    );
  }
}
