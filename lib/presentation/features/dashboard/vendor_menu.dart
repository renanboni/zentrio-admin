import 'package:shadcn_ui/shadcn_ui.dart';

import '../../components/sidebar/models/side_bar_item.dart';
import '../../components/sidebar/side_bar_item_list.dart';

getVendorMenu() {
  return [
    const SideBarItem(
      label: "Products",
      icon: LucideIcons.tag,
      selected: true,
      route: "/products",
      children: [
        SideBarItem(
          label: "Collections",
          route: "/collections",
        ),
        SideBarItem(
            label: "Categories",
            route: "/categories",
        ),
      ]
    ),
    const SideBarItem(
      label: "Customers",
      icon: LucideIcons.users,
      route: "/customers",
    ),
    const SideBarItem(
      label: "Settings",
      type: SideBarItemType.title,
    ),
    const SideBarItem(
      label: "App settings",
      icon: LucideIcons.settings,
      route: "/settings",
    ),
  ];
}
