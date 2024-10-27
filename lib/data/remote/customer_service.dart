import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:zentrio_admin/data/models/api_customer.dart';

import '../models/res/customers_response.dart';

part 'customer_service.g.dart';

@RestApi()
abstract class CustomerService {
  factory CustomerService(@Named("authenticated") Dio dio, {String baseUrl}) =
      _CustomerService;

  @GET("/vendor/customers")
  Future<CustomersResponse> getAll(
    @Query("limit") int limit,
    @Query("offset") int offset,
  );
}
