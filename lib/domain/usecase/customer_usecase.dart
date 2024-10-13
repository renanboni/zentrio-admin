
import 'package:injectable/injectable.dart';
import 'package:zentrio_admin/domain/models/customer.dart';
import 'package:zentrio_admin/domain/repositories/customer_repository.dart';

@injectable
class CustomerUseCase {
  final CustomerRepository _repository;

  CustomerUseCase(this._repository);

  Future<List<Customer>> getAll()  {
    return _repository.getAll();
  }
}