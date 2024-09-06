import 'package:injectable/injectable.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/domain/usecase/auth_usecase.dart';
import 'package:zentrio_admin/presentation/features/dashboard/vendor_menu.dart';

import '../../../domain/models/user_type.dart';
import '../../components/sidebar/models/side_bar_item.dart';
import '../../components/sidebar/side_bar_item_list.dart';
import 'admin_menu.dart';

@lazySingleton
class DashboardViewModel {
  final AuthUseCase _authUseCase;

  final Signal<List<SideBarItem>> menu = signal([]);

  DashboardViewModel(
    this._authUseCase,
  ) {
    menu.value = _authUseCase.getUserType() == UserType.user
        ? getAdminMenu()
        : getVendorMenu();
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
