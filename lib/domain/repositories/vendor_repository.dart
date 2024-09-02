
import '../models/vendor.dart';

abstract class VendorRepository {
  Future<List<Vendor>> getAll();
}