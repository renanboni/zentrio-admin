import 'package:flutter/cupertino.dart';

class SideBarItem {
  final String label;
  final IconData? icon;
  final Function()? onTap;

  SideBarItem({
    required this.label,
    this.icon,
    this.onTap,
  });
}
