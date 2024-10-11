
import 'package:zentrio_admin/data/models/req/create_banner_req.dart';
import 'package:zentrio_admin/domain/models/Banner.dart';

import '../models/media_file.dart';
import '../models/medusa_file.dart';

abstract class BannerRepository {
  Future<List<Banner>> getBanners();

  Future<void> createBanner(CreateBannerReq req);

  Future<List<MedusaFile>> uploadFiles(List<MediaFile> files);
}
