
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zentrio_admin/data/mappers/file_mapper.dart';
import 'package:zentrio_admin/data/remote/file_service.dart';

import '../domain/models/medusa_file.dart';
import '../domain/repositories/file_repository.dart';

@lazySingleton
class FileRepositoryImpl implements FileRepository {

  final FileService _fileService;

  FileRepositoryImpl(this._fileService);

  @override
  Future<List<MedusaFile>> upload(List<File> files) async {
    final multipartFiles = await Future.wait(
        files.map((e) => MultipartFile.fromFile(e.path))
    );

    return _fileService.upload(multipartFiles)
        .then((value) => value.map((e) => e.toMediaFile()).toList());
  }
}