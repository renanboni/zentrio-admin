
import 'package:zentrio_admin/domain/models/medusa_file.dart';

import '../models/api_file.dart';

extension ApiFileMapper on ApiFile {
  MedusaFile toMediaFile() {
    return MedusaFile(
      id: id ?? "",
      url: url ?? "",
    );
  }
}
