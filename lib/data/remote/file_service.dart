
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../models/api_file.dart';

part 'file_service.g.dart';

@RestApi()
abstract class FileService {
  factory FileService(@Named("authenticated")  Dio dio, {String baseUrl}) = _FileService;

  @POST("/vendor/uploads")
  Future<List<ApiFile>> upload(@Part() List<MultipartFile> files);
}
