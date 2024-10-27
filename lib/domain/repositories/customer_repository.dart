
import 'package:zentrio_admin/domain/models/paginated_response.dart';

import '../models/customer.dart';

abstract class CustomerRepository {
  Future<PaginatedResponse<Customer>> getAll({int limit = 10, int offset = 0});
}
