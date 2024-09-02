import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:zentrio_admin/data/models/res/api_vendors.dart';

part 'vendor_service.g.dart';

@RestApi()
abstract class VendorService {
  factory VendorService(Dio dio, {String baseUrl}) = _VendorService;

  @GET("/vendors")
  Future<VendorsResponse> getAll();
}
