

import 'dart:typed_data';

import 'package:zentrio_admin/domain/models/medusa_file.dart';

import '../models/media_file.dart';

abstract class FileRepository {
  Future<List<MedusaFile>> upload(List<String> paths);

  Future<List<MedusaFile>> uploadBytes(List<Uint8List> bytes);

  Future<List<MedusaFile>> uploadFiles(List<MediaFile> files);
}