import 'package:flutter/cupertino.dart';

import '../side_bar_item_list.dart';

class SideBarItem {
  final String label;
  final IconData? icon;
  final SideBarItemType type;
  final bool selected;
  final String route;

  final Function()? onTap;

  SideBarItem({
    required this.label,
    this.route = "",
    this.type = SideBarItemType.list,
    this.selected = false,
    this.icon,
    this.onTap,
  });

  SideBarItem copyWith({
    String? label,
    IconData? icon,
    SideBarItemType? type,
    bool? selected,
    String? route,
    Function()? onTap,
  }) {
    return SideBarItem(
      label: label ?? this.label,
      icon: icon ?? this.icon,
      type: type ?? this.type,
      selected: selected ?? this.selected,
      route: route ?? this.route,
      onTap: onTap ?? this.onTap,
    );
  }
}
