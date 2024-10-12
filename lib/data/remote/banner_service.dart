import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:zentrio_admin/data/models/api_banner.dart';
import 'package:zentrio_admin/data/models/req/create_banner_req.dart';

import '../models/res/files_response.dart';

part 'banner_service.g.dart';

@RestApi()
abstract class BannerService {
  factory BannerService(@Named("authenticated") Dio dio, {
    String baseUrl,
  }) = _BannerService;

  @GET("/vendor/banners")
  Future<List<ApiBanner>> getBanners();

  @POST("/vendor/banners")
  Future<void> createBanner(@Body() CreateBannerReq req);

  @DELETE("/vendor/banners/{id}")
  Future<void> deleteBanner(@Path("id") String id);

  @POST("/vendor/banners/upload")
  @MultiPart()
  Future<FilesResponse> upload(@Part(name: "files") List<MultipartFile> files);
}