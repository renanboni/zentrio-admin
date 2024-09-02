import 'package:zentrio_admin/data/mappers/vendor_mapper.dart';
import 'package:zentrio_admin/data/remote/vendor_service.dart';

import '../domain/models/vendor.dart';
import '../domain/repositories/vendor_repository.dart';

class VendorRepositoryImpl implements VendorRepository {
  final VendorService _service;

  VendorRepositoryImpl(this._service);

  @override
  Future<List<Vendor>> getAll() {
    return _service
        .getAll()
        .then((value) => value.vendors.map((e) => e.toVendor()).toList());
  }
}
