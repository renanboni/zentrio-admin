import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/presentation/components/sidebar/models/side_bar_item.dart';

class SideBarItemList extends StatelessWidget {
  final SideBarItem item;

  const SideBarItemList({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return ShadButton.ghost(
      width: double.infinity,
      mainAxisAlignment: MainAxisAlignment.start,
      icon: item.icon != null
          ? ShadImage.square(
              size: 16,
              item.icon!,
            )
          : null,
      size: ShadButtonSize.sm,
      child: Text(item.label),
    );
  }
}
