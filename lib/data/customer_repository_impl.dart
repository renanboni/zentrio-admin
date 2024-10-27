import 'package:zentrio_admin/data/mappers/customer_mapper.dart';
import 'package:zentrio_admin/data/remote/customer_service.dart';
import 'package:zentrio_admin/domain/models/customer.dart';
import 'package:zentrio_admin/domain/repositories/customer_repository.dart';

import '../domain/models/paginated_response.dart';

class CustomerRepositoryImpl implements CustomerRepository {
  final CustomerService _customerService;

  CustomerRepositoryImpl(this._customerService);

  @override
  Future<PaginatedResponse<Customer>> getAll({int limit = 10, int offset = 0}) {
    return _customerService.getAll(limit, offset).then(
          (response) {
        return PaginatedResponse<Customer>(
          count: response.count ?? 0,
          offset: response.offset ?? 0,
          limit: response.limit ?? 0,
          data: response.data?.map((e) => e.toCustomer()).toList() ?? [],
        );
      },
    );
  }
}
