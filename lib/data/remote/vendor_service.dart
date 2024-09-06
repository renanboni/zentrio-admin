import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:zentrio_admin/data/models/res/api_vendors.dart';

import '../models/res/vendor_admin_response.dart';

part 'vendor_service.g.dart';

@RestApi()
abstract class VendorService {
  factory VendorService(@Named("authenticated")  Dio dio, {String baseUrl}) = _VendorService;

  @GET("/vendors")
  Future<VendorsResponse> getAll();

  @GET("/vendor")
  Future<VendorAdminResponse> getVendorAdmin();
}
