import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/domain/models/product_option.dart';
import 'package:zentrio_admin/domain/usecase/product_usecase.dart';

@Injectable()
class ProductCreateVariantsViewModel {
  final ProductUseCase _productUseCase;

  final ListSignal<ProductOption> options = ListSignal<ProductOption>([]);
  final Signal<String> title = Signal<String>('');
  final Signal<String> sku = Signal<String>('');
  final Signal<bool> manageInventory = Signal<bool>(false);
  final Signal<bool> allowBackorders = Signal<bool>(false);
  final Signal<bool> inventoryKit = Signal<bool>(false);

  final Map<String, String> optionValues = {};

  ProductCreateVariantsViewModel(
    this._productUseCase,
  );

  void init(String productId) async {
    try {
      options.value = await _productUseCase.getProductOptions(productId);
    } catch (e) {
      print(e);
    }
  }

  void addOptionValue(String option, String value) {
    optionValues[option] = value;
    print(optionValues);
  }
}
