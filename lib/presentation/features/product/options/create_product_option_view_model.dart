
import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';

@Injectable()
class CreateProductOptionViewModel {
  final ListSignal<String> variations = ListSignal<String>([]);


}
