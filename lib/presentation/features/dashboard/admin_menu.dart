import 'package:shadcn_ui/shadcn_ui.dart';

import '../../components/sidebar/models/side_bar_item.dart';
import '../../components/sidebar/side_bar_item_list.dart';

getAdminMenu() {
  return [
    SideBarItem(
      label: "Vendors",
      selected: true,
      icon: LucideIcons.store,
      route: "/vendors",
    ),
    SideBarItem(
      label: "Users",
      icon: LucideIcons.user,
      route: "/users",
    ),
    SideBarItem(
      label: "Settings",
      type: SideBarItemType.title,
    ),
    SideBarItem(
      label: "App settings",
      icon: LucideIcons.settings,
      route: "/settings",
    ),
  ];
}