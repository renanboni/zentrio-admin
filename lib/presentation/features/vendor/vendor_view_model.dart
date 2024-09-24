import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/domain/models/vendor.dart';
import 'package:zentrio_admin/domain/usecase/vendor_usecase.dart';

@Injectable()
class VendorViewModel {
  final VendorUseCase _vendorUseCase;

  final Signal<Vendor> vendor = Signal(const Vendor.empty());

  VendorViewModel(this._vendorUseCase);

  void getVendorById(String vendorId) async {
    try {
      vendor.value = await _vendorUseCase.getVendor(vendorId);
    } catch (e) {
      print("");
    }
  }
}
