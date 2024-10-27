import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../models/req/create_campaign_req.dart';
import '../models/res/campaigns_response.dart';

part 'promotion_service.g.dart';

@RestApi()
abstract class PromotionService {
  factory PromotionService(
    @Named("authenticated") Dio dio, {
    String baseUrl,
  }) = _PromotionService;

  @GET("/vendor/campaigns")
  Future<CampaignsResponse> getAll(
    @Query("limit") int limit,
    @Query("offset") int offset,
  );

  @POST("/vendor/campaigns")
  Future<void> createCampaign(
    @Body() CreateCampaignReq req,
  );
}
