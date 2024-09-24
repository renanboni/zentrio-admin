
import 'package:injectable/injectable.dart';
import 'package:zentrio_admin/domain/models/vendor.dart';
import 'package:zentrio_admin/domain/models/vendor_admin.dart';
import 'package:zentrio_admin/domain/repositories/vendor_repository.dart';

@injectable
class VendorUseCase {
  final VendorRepository _vendorRepository;

  VendorUseCase(this._vendorRepository);

  Future<List<Vendor>> getAll() async {
    return _vendorRepository.getAll();
  }

  Future<VendorAdmin> getVendorAdmin() async {
    return _vendorRepository.getVendorAdmin();
  }

  Future<Vendor> getVendor(String vendorId) async {
    return _vendorRepository.getVendorById(vendorId);
  }
}