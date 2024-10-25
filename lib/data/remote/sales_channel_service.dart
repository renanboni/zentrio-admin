import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:zentrio_admin/data/models/res/sales_channels_response.dart';

import '../models/req/create_sales_channel_req.dart';

part 'sales_channel_service.g.dart';

@RestApi()
abstract class SalesChannelService {
  factory SalesChannelService(@Named("authenticated") Dio dio,
      {String baseUrl}) = _SalesChannelService;

  @GET("/vendor/sales-channels")
  Future<SalesChannelsResponse> getAll(
    @Query("limit") int limit,
    @Query("offset") int offset,
  );

  @POST("/vendor/sales-channels")
  Future<void> createSalesChannel(@Body() CreateSalesChannelReq req);

  @DELETE("/vendor/sales-channels/{id}")
  Future<void> deleteSalesChannel(@Path("id") String id);
}
