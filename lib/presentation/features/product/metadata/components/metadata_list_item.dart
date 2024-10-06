import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/domain/models/metadata.dart';

class MetadataListItem extends StatefulWidget {
  final Metadata metadata;
  final ValueChanged<String> onKeyChanged;
  final ValueChanged<String> onValueChanged;
  final VoidCallback onAddRowAbove;
  final VoidCallback onAddRowBelow;
  final VoidCallback onDeleteRow;

  const MetadataListItem({
    super.key,
    required this.metadata,
    required this.onKeyChanged,
    required this.onValueChanged,
    required this.onAddRowAbove,
    required this.onAddRowBelow,
    required this.onDeleteRow,
  });

  @override
  State<MetadataListItem> createState() => _MetadataListItemState();
}

class _MetadataListItemState extends State<MetadataListItem> {
  final _controller = ShadContextMenuController();

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return SizedBox(
      height: 36,
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ShadInput(
                    initialValue: widget.metadata.key,
                    placeholder: Text(
                      "Key",
                      style: theme.textTheme.small.copyWith(
                          color: Colors.grey
                      ),
                    ),
                    onChanged: widget.onKeyChanged,
                    style: theme.textTheme.small,
                    decoration: const ShadDecoration(
                      border: ShadBorder(),
                      focusedBorder: ShadBorder(),
                      shape: null,
                      fallbackToBorder: false,
                    ),
                  ),
                ),
                const VerticalDivider(
                  width: 2,
                ),
                Expanded(
                  child: ShadInput(
                    initialValue: widget.metadata.value.toString(),
                    placeholder: Text(
                      "Value",
                      style: theme.textTheme.small.copyWith(
                        color: Colors.grey
                      ),
                    ),
                    style: theme.textTheme.small,
                    onChanged: widget.onValueChanged,
                    decoration: const ShadDecoration(
                      border: ShadBorder(),
                      focusedBorder: ShadBorder(),
                      shape: null,
                      fallbackToBorder: false,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const VerticalDivider(width: 1),
          _buildTrailing(),
        ],
      ),
    );
  }

  _buildTrailing() {
    return ShadContextMenu(
      controller: _controller,
      items: [
        ShadContextMenuItem(
          leading: const ShadImage.square(
            LucideIcons.moveUp,
            size: 16,
          ),
          onPressed: widget.onAddRowAbove,
          child: const Text("Insert row above"),
        ),
        ShadContextMenuItem(
          leading: const ShadImage.square(
            LucideIcons.moveDown,
            size: 16,
          ),
          onPressed: widget.onAddRowBelow,
          child: const Text("Insert row below"),
        ),
        const Divider(height: 1),
        ShadContextMenuItem(
          leading: const ShadImage.square(
            LucideIcons.trash,
            size: 16,
          ),
          onPressed: widget.onDeleteRow,
          child: const Text("Delete row"),
        ),
      ],
      child: ShadButton.outline(
        size: ShadButtonSize.sm,
        decoration: const ShadDecoration(
          border: ShadBorder(),
          shape: null,
          fallbackToBorder: false,
        ),
        onPressed: _controller.toggle,
        child: const Icon(
          LucideIcons.ellipsisVertical,
          size: 16,
        ),
      ),
    );
  }
}
