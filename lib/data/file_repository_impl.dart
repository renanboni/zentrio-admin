import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zentrio_admin/data/mappers/file_mapper.dart';
import 'package:zentrio_admin/data/remote/file_service.dart';
import 'package:zentrio_admin/domain/models/media_file.dart';

import '../domain/models/medusa_file.dart';
import '../domain/repositories/file_repository.dart';

@lazySingleton
class FileRepositoryImpl implements FileRepository {
  final FileService _fileService;

  FileRepositoryImpl(this._fileService);

  @override
  Future<List<MedusaFile>> upload(List<String> paths) async {
    final multipartFiles =
        await Future.wait(paths.map((e) => MultipartFile.fromFile(e)));

    return _fileService
        .upload(multipartFiles)
        .then((value) => value.files.map((e) => e.toMediaFile()).toList());
  }

  @override
  Future<List<MedusaFile>> uploadBytes(List<Uint8List> bytes) async {
    final multipartFiles =
        bytes.map((e) => MultipartFile.fromBytes(e)).toList();

    return _fileService
        .upload(multipartFiles)
        .then((value) => value.files.map((e) => e.toMediaFile()).toList());
  }

  @override
  Future<List<MedusaFile>> uploadFiles(List<MediaFile> files) {
    final multipartFiles = files
        .map(
          (e) => MultipartFile.fromBytes(
            e.bytes ?? [],
            filename: e.name,
            contentType: DioMediaType.parse(e.mimeType),
          ),
        )
        .toList();

    return _fileService
        .upload(multipartFiles)
        .then((value) => value.files.map((e) => e.toMediaFile()).toList());
  }
}
