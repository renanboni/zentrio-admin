import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../side_bar_item_list.dart';

class SideBarItem extends Equatable {
  final String label;
  final IconData? icon;
  final SideBarItemType type;
  final bool selected;
  final bool expanded;
  final String route;
  final List<SideBarItem> children;

  final Function()? onTap;

  const SideBarItem({
    required this.label,
    this.route = "",
    this.type = SideBarItemType.list,
    this.selected = false,
    this.expanded = false,
    this.icon,
    this.children = const [],
    this.onTap,
  });

  SideBarItem copyWith({
    String? label,
    IconData? icon,
    SideBarItemType? type,
    bool? selected,
    bool? expanded,
    String? route,
    List<SideBarItem>? children,
  }) {
    return SideBarItem(
      label: label ?? this.label,
      icon: icon ?? this.icon,
      type: type ?? this.type,
      selected: selected ?? this.selected,
      expanded: expanded ?? this.expanded,
      route: route ?? this.route,
      children: children ?? this.children,
    );
  }

  @override
  List<Object?> get props => [
        label,
        icon,
        type,
        selected,
        route,
        expanded,
        children,
      ];
}
