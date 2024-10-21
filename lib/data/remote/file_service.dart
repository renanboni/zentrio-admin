

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../models/res/files_response.dart';

part 'file_service.g.dart';

@RestApi()
abstract class FileService {
  factory FileService(@Named("authenticated")  Dio dio, {String baseUrl}) = _FileService;

  @POST("/vendor/uploads")
  @MultiPart()
  Future<FilesResponse> upload(@Part(name: "files") List<MultipartFile> files);
}
