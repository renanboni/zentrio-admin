import '../../domain/models/vendor.dart';
import '../../domain/models/vendor_admin.dart';
import '../models/api_vendor_admin.dart';
import '../models/res/api_vendor.dart';

extension ApiVendorToVendor on ApiVendor {
  Vendor toVendor() {
    return Vendor(
      id: id ?? '',
      name: name ?? '',
      handle: handle ?? '',
      logo: logo ?? '',
    );
  }
}

extension ApiVendorAdminToVendorAdmin on ApiVendorAdmin {
  VendorAdmin toVendorAdmin() {
    return VendorAdmin(
      id: id ?? '',
      firstName: firstName ?? '',
      lastName: lastName ?? '',
      email: email ?? '',
      vendor: vendor?.toVendor() ?? const Vendor.empty(),
      createdAt: DateTime.tryParse(createdAt ?? ''),
      updatedAt: DateTime.tryParse(updatedAt ?? ''),
      deletedAt: DateTime.tryParse(deletedAt ?? ''),
    );
  }
}