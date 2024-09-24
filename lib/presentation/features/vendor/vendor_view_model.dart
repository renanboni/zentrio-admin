import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/domain/models/api_key.dart';
import 'package:zentrio_admin/domain/models/vendor.dart';
import 'package:zentrio_admin/domain/usecase/api_key_usecase.dart';
import 'package:zentrio_admin/domain/usecase/vendor_usecase.dart';

@Injectable()
class VendorViewModel {
  final VendorUseCase _vendorUseCase;
  final ApiKeyUseCase _apiKeyUseCase;

  final Signal<Vendor> vendor = signal(const Vendor.empty());
  final Signal<ApiKey> apiKey = signal(ApiKey.empty());

  VendorViewModel(
    this._vendorUseCase,
    this._apiKeyUseCase,
  );

  void getVendorById(String vendorId) async {
    try {
      vendor.value = await _vendorUseCase.getVendor(vendorId);
      apiKey.value = await _apiKeyUseCase.getStoreApiKey(vendorId);
    } catch (e) {
      print("");
    }
  }
}
