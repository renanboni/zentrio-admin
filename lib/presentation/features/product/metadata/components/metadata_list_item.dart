import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
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
  final ShadContextMenuController controller = ShadContextMenuController();
  final isHovering = signal(false);
  late final isMenuOpen = computed(() {
    print("visible");
    return controller.isOpen.asSignal().value;
  });
  final groupId = UniqueKey();

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ShadMouseArea(
      groupId: groupId,
      onEnter: (_) {
        isHovering.value = true;
      },
      onExit: (_) {
        isHovering.value = false;
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            height: 36,
            child: Row(
              children: [
                Expanded(
                  child: ShadInput(
                    placeholder: Text(
                      "Key",
                      style: theme.textTheme.small,
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
                    placeholder: Text(
                      "Value",
                      style: theme.textTheme.small,
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
          if (isHovering.watch(context) || isMenuOpen.watch(context))
            Positioned(
              right: -16,
              child: _buildTrailing(),
            )
        ],
      ),
    );
  }

  _buildTrailing() {
    return ShadContextMenu(
      groupId: groupId,
      controller: controller,
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
        icon: const Icon(
          LucideIcons.ellipsisVertical,
          size: 16,
        ),
        onPressed: () {
          controller.toggle();
        },
      ),
    );
  }
}
