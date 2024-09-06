
import 'package:zentrio_admin/domain/models/vendor_admin.dart';

import '../models/vendor.dart';

abstract class VendorRepository {
  Future<List<Vendor>> getAll();

  Future<VendorAdmin> getVendorAdmin();
}