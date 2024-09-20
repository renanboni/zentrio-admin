
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:zentrio_admin/domain/models/medusa_file.dart';
import 'package:zentrio_admin/domain/repositories/file_repository.dart';

@injectable
class FileUseCase {

  final FileRepository _fileRepository;

  FileUseCase(this._fileRepository);

  Future<List<MedusaFile>> upload(List<File> files) {
    return _fileRepository.upload(files);
  }
}
