import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ContextMenuItem extends Equatable {
  final String? id;
  final String? title;
  final IconData? icon;
  final bool isDivider;

  const ContextMenuItem({
    this.id,
    this.title,
    this.icon,
    this.isDivider = false,
  });

  @override
  List<Object?> get props => [id, title, isDivider];  // Include 'isDivider' in equality
}

class ContextMenu extends StatefulWidget {
  final List<ContextMenuItem> items;
  final Function(ContextMenuItem) onClick;

  const ContextMenu({
    super.key,
    required this.items,
    required this.onClick,
  });

  @override
  State<ContextMenu> createState() => _ContextMenuState();
}

class _ContextMenuState extends State<ContextMenu> {
  final _controller = ShadContextMenuController();

  @override
  Widget build(BuildContext context) {
    return ShadContextMenu(
      controller: _controller,
      visible: _controller.isOpen,
      items: widget.items
          .map(
            (item) => item.isDivider
            ? const Divider()
            : ShadContextMenuItem(
          leading: ShadImage.square(
            item.icon!,
            size: 16,
          ),
          onPressed: () {
            widget.onClick(item);
            _controller.toggle();
          },
          child: Text(item.title!),
        ),
      )
          .toList(),
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
}