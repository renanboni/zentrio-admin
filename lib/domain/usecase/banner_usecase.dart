import 'package:injectable/injectable.dart';
import 'package:zentrio_admin/data/models/req/create_banner_req.dart';

import '../models/Banner.dart';
import '../models/media_file.dart';
import '../models/medusa_file.dart';
import '../repositories/banner_repository.dart';

@injectable
class BannerUseCase {
  final BannerRepository _bannerRepository;

  BannerUseCase(this._bannerRepository);

  Future<List<Banner>> getBanners() {
    return _bannerRepository.getBanners();
  }

  Future<void> createBanner(CreateBannerReq banner) {
    return _bannerRepository.createBanner(banner);
  }

  Future<List<MedusaFile>> uploadFiles(List<MediaFile> files) {
    return _bannerRepository.uploadFiles(files);
  }

  Future<void> deleteBanner(String id) {
    return _bannerRepository.deleteBanner(id);
  }
}
