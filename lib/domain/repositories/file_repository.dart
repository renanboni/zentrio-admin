

import 'dart:typed_data';

import 'package:zentrio_admin/domain/models/medusa_file.dart';

abstract class FileRepository {
  Future<List<MedusaFile>> upload(List<String> paths);

  Future<List<MedusaFile>> uploadBytes(List<Uint8List> bytes);
}