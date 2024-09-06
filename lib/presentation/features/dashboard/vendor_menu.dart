import 'package:shadcn_ui/shadcn_ui.dart';

import '../../components/sidebar/models/side_bar_item.dart';
import '../../components/sidebar/side_bar_item_list.dart';

getVendorMenu() {
  return [
    SideBarItem(
      label: "Products",
      icon: LucideIcons.tag,
      selected: true,
      route: "/products",
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
