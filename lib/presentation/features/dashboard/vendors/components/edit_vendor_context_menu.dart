import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class EditVendorContextMenu extends StatefulWidget {
  const EditVendorContextMenu({super.key});

  @override
  State<EditVendorContextMenu> createState() => _EditVendorContextMenuState();
}

class _EditVendorContextMenuState extends State<EditVendorContextMenu> {
  final _controller = ShadContextMenuController();

  @override
  Widget build(BuildContext context) {
    return ShadContextMenu(
      controller: _controller,
      visible: _controller.isOpen,
      children: [
        ShadContextMenuItem(
          leading: const ShadImage.square(
            LucideIcons.pencil,
            size: 16,
          ),
          child: const Text("Edit"),
          onPressed: () {},
        ),
        const Divider(height: 8),
        ShadContextMenuItem(
          leading: const ShadImage.square(
            LucideIcons.trash,
            size: 16,
          ),
          child: _deleteVendorDialog(),
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

  _deleteVendorDialog() {
    return InkWell(
      child: const Text('Delete'),
      onTap: () {
        showShadDialog(
          context: context,
          builder: (context) => ShadDialog.alert(
            title: const Text('Are you sure?'),
            description: const Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Text(
                'You are about to delete this vendor. This action cannot be undone.',
              ),
            ),
            actions: [
              ShadButton.outline(
                child: const Text('Cancel'),
                onPressed: () => Navigator.of(context).pop(false),
              ),
              ShadButton(
                child: const Text('Continue'),
                onPressed: () => Navigator.of(context).pop(true),
              ),
            ],
          ),
        );
      },
    );
  }
}
