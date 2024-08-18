import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/presentation/components/sidebar/models/side_bar_item.dart';

enum SideBarItemType {
  title,
  list,
  button,
}

class SideBarItemList extends StatefulWidget {
  final SideBarItem item;
  final VoidCallback? onTap;

  const SideBarItemList({
    super.key,
    this.onTap,
    required this.item,
  });

  @override
  State<SideBarItemList> createState() => _SideBarItemListState();
}

class _SideBarItemListState extends State<SideBarItemList> {
  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    switch (widget.item.type) {
      case SideBarItemType.title:
        return _buildTitle();
      case SideBarItemType.list:
        return _buildList(theme, selected: widget.item.selected);
      case SideBarItemType.button:
        return _buildButton();
    }
  }

  _buildTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: Text(
        widget.item.label,
        style: ShadTheme.of(context).textTheme.table,
      ),
    );
  }

  _buildList(
    ShadThemeData theme, {
    bool selected = false,
  }) {
    return ShadButton.ghost(
      width: double.infinity,
      onTapDown: (_) {
        if (widget.onTap != null) {
          widget.onTap!();
        }
      },
      backgroundColor: selected
          ? theme.ghostButtonTheme.hoverBackgroundColor
          : theme.ghostButtonTheme.backgroundColor,
      mainAxisAlignment: MainAxisAlignment.start,
      icon: widget.item.icon != null
          ? ShadImage.square(
              size: 16,
              widget.item.icon!,
            )
          : null,
      size: ShadButtonSize.sm,
      child: Text(widget.item.label),
    );
  }

  _buildButton() {
    return ShadButton.outline(
      width: double.infinity,
      onTapDown: (_) {
        if (widget.onTap != null) {
          widget.onTap!();
        }
      },
      mainAxisAlignment: MainAxisAlignment.center,
      icon: widget.item.icon != null
          ? ShadImage.square(
              size: 16,
              widget.item.icon!,
            )
          : null,
      size: ShadButtonSize.sm,
      child: Text(widget.item.label),
    );
  }
}
