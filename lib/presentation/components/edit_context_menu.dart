import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class EditContextMenu extends StatefulWidget {
  final String deleteDialogTitle;
  final String deleteDialogDescription;
  final VoidCallback onEdit;
  final VoidCallback? onDelete;

  const EditContextMenu({
    super.key,
    this.deleteDialogTitle = "",
    this.deleteDialogDescription = "",
    this.onDelete,
    required this.onEdit,
  });

  @override
  State<EditContextMenu> createState() => _EditContextMenuState();
}

class _EditContextMenuState extends State<EditContextMenu> {
  final _controller = ShadContextMenuController();

  @override
  Widget build(BuildContext context) {
    return ShadContextMenu(
      controller: _controller,
      visible: _controller.isOpen,
      items: [
        ShadContextMenuItem(
          leading: const ShadImage.square(
            LucideIcons.pencil,
            size: 16,
          ),
          onPressed: widget.onEdit,
          child: const Text("Edit"),
        ),
        if (widget.onDelete != null) const Divider(height: 8),
        if (widget.onDelete != null)
          ShadContextMenuItem(
            leading: const ShadImage.square(
              LucideIcons.trash,
              size: 16,
            ),
            child: _deleteDialog(),
          ),
      ],
      child: ShadButton.ghost(
        icon: const Icon(
          LucideIcons.ellipsis,
          size: 16,
        ),
        onPressed: () {
          _controller.toggle();
        },
      ),
    );
  }

  _deleteDialog() {
    return InkWell(
      child: const Text("Delete"),
      onTap: () {
        showShadDialog(
          context: context,
          builder: (context) => ShadDialog.alert(
            title: Text(widget.deleteDialogTitle),
            description: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(widget.deleteDialogDescription),
            ),
            actions: [
              ShadButton.outline(
                size: ShadButtonSize.sm,
                child: const Text('Cancel'),
                onPressed: () => Navigator.of(context).pop(false),
              ),
              const SizedBox(width: 8),
              ShadButton.destructive(
                size: ShadButtonSize.sm,
                child: const Text('Continue'),
                onPressed: () async {
                  widget.onDelete?.call();
                  _controller.hide();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
