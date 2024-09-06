import 'package:injectable/injectable.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/domain/models/vendor.dart';
import 'package:zentrio_admin/domain/models/vendor_admin.dart';
import 'package:zentrio_admin/domain/usecase/auth_usecase.dart';
import 'package:zentrio_admin/domain/usecase/vendor_usecase.dart';
import 'package:zentrio_admin/presentation/features/dashboard/vendor_menu.dart';

import '../../../domain/models/user_type.dart';
import '../../components/sidebar/models/side_bar_item.dart';
import '../../components/sidebar/side_bar_item_list.dart';
import 'admin_menu.dart';

@lazySingleton
class DashboardViewModel {
  final AuthUseCase _authUseCase;
  final VendorUseCase _vendorUseCase;

  final Signal<List<SideBarItem>> menu = signal([]);
  final Signal<Vendor> vendor = signal(const Vendor.empty());

  DashboardViewModel(
    this._authUseCase,
    this._vendorUseCase,
  ) {
    if (_authUseCase.getUserType() == UserType.user) {
      menu.value = getAdminMenu();
    } else {
      menu.value = getVendorMenu();
      _getVendor();
    }
  }

  _getVendor() async {
    try {
      final vendorAdmin = await _vendorUseCase.getVendorAdmin();
      vendor.value = vendorAdmin.vendor;
    } catch (e) {
      print(e);
    }
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
