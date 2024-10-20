import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:zentrio_admin/data/models/res/sales_channels_response.dart';

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
}
