
import '../models/customer.dart';

abstract class CustomerRepository {
  Future<List<Customer>> getAll();
}
