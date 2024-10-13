
import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/domain/models/customer.dart';
import 'package:zentrio_admin/domain/usecase/customer_usecase.dart';

@Injectable()
class CustomersViewModel {

  final ListSignal<Customer> customers = ListSignal([]);

  final CustomerUseCase _customerUseCase;

  CustomersViewModel(this._customerUseCase) {
    _getCustomers();
  }

  _getCustomers() async {
    try {
      customers.value = await _customerUseCase.getAll();
    } catch (e) {
      print(e);
    }
  }
}