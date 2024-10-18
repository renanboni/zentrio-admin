
import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/domain/models/product_type.dart';

@Injectable()
class ProductTypesViewModel {

  final ListSignal<ProductType> productTypes = ListSignal<ProductType>([]);
}