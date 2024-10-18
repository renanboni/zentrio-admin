
import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';

@Injectable()
class CreateProductTypeViewModel {

  final Signal<String> value = Signal<String>("");


  void onCreate() {

  }
}