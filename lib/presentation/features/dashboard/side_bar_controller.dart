import 'package:injectable/injectable.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals.dart';

import '../../components/sidebar/models/side_bar_item.dart';

@lazySingleton
class SideBarController {
  final Signal<List<SideBarItem>> menu = signal([]);

  SideBarController() {
    menu.value = _getAdminMenu();
  }

  _getAdminMenu() {
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
    ];
  }

  onTap(SideBarItem item) {
    menu.value = menu.value.map((e) {
      if (e.label == item.label) {
        return e.copyWith(selected: true);
      }
      return e.copyWith(selected: false);
    }).toList();
  }
}
