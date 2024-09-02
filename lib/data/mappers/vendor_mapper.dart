import '../../domain/models/vendor.dart';
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
