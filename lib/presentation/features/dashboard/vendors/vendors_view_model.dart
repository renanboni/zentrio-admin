
import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/domain/models/vendor.dart';
import 'package:zentrio_admin/domain/usecase/vendor_usecase.dart';

@injectable
class VendorsViewModel {

  final VendorUseCase _vendorUseCase;

  final Signal<List<Vendor>> vendors = signal([]);

  VendorsViewModel(this._vendorUseCase) {
    _getAll();
  }

  _getAll() async {
    try {
      vendors.value = await _vendorUseCase.getAll();
    } catch (e) {
      print(e);
    }
  }
}