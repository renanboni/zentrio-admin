
import 'dart:io';
import 'dart:typed_data';

import 'package:injectable/injectable.dart';
import 'package:zentrio_admin/domain/models/media_file.dart';
import 'package:zentrio_admin/domain/models/medusa_file.dart';
import 'package:zentrio_admin/domain/repositories/file_repository.dart';

@injectable
class FileUseCase {

  final FileRepository _fileRepository;

  FileUseCase(this._fileRepository);

  Future<List<MedusaFile>> upload(List<String> paths) {
    return _fileRepository.upload(paths);
  }

  Future<List<MedusaFile>> uploadBytes(List<Uint8List> bytes) {
    return _fileRepository.uploadBytes(bytes);
  }

  Future<List<MedusaFile>> uploadFiles(List<MediaFile> files) {
    return _fileRepository.uploadFiles(files);
  }
}
