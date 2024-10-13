import 'package:zentrio_admin/data/mappers/customer_mapper.dart';
import 'package:zentrio_admin/data/remote/customer_service.dart';
import 'package:zentrio_admin/domain/models/customer.dart';
import 'package:zentrio_admin/domain/repositories/customer_repository.dart';

class CustomerRepositoryImpl implements CustomerRepository {
  final CustomerService _customerService;

  CustomerRepositoryImpl(this._customerService);

  @override
  Future<List<Customer>> getAll() {
    return _customerService
        .getAll()
        .then((value) => value.map((e) => e.toCustomer()).toList());
  }
}
