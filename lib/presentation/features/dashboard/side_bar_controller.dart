import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/domain/models/vendor.dart';
import 'package:zentrio_admin/domain/usecase/auth_usecase.dart';
import 'package:zentrio_admin/domain/usecase/vendor_usecase.dart';
import 'package:zentrio_admin/presentation/features/dashboard/vendor_menu.dart';

import '../../../domain/models/user_type.dart';
import '../../components/sidebar/models/side_bar_item.dart';
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

  onTap(SideBarItem selectedItem) {
    menu.value = menu.value.map((item) {
      // If it's the parent being clicked
      if (selectedItem.label == item.label) {
        return item.copyWith(
          selected: true, // Select only if it has no children
          expanded: item.children.isNotEmpty, // Expand if it has children
          children: item.children.map((child) {
            return child.copyWith(selected: false);
          }).toList(),
        );
      }

      // If it's a child item being clicked
      if (item.children.any((child) => selectedItem.label == child.label)) {
        return item.copyWith(
          selected: false,
          expanded: true, // Keep the parent expanded
          children: item.children.map((child) {
            return child.copyWith(
              selected: child.label == selectedItem.label, // Select the clicked child
            );
          }).toList(),
        );
      }

      // For other items, collapse and deselect them
      return item.copyWith(
        selected: false,
        expanded: false,
        children: item.children.map((child) {
          return child.copyWith(selected: false);
        }).toList(),
      );
    }).toList();
  }
}
