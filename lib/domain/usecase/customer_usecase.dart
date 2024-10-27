
import 'package:injectable/injectable.dart';
import 'package:zentrio_admin/domain/models/customer.dart';
import 'package:zentrio_admin/domain/models/paginated_response.dart';
import 'package:zentrio_admin/domain/repositories/customer_repository.dart';

@injectable
class CustomerUseCase {
  final CustomerRepository _repository;

  CustomerUseCase(this._repository);

  Future<PaginatedResponse<Customer>> getAll({int limit = 10, int offset = 0})  {
    return _repository.getAll(limit: limit, offset: offset);
  }
}