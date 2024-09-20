
import 'dart:io';

import 'package:zentrio_admin/domain/models/medusa_file.dart';

abstract class FileRepository {
  Future<List<MedusaFile>> upload(List<File> files);
}