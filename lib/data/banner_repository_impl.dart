
import 'package:zentrio_admin/data/mappers/banner_mapper.dart';
import 'package:zentrio_admin/data/models/req/create_banner_req.dart';
import 'package:zentrio_admin/data/remote/banner_service.dart';
import 'package:zentrio_admin/domain/models/Banner.dart';

import '../domain/repositories/banner_repository.dart';

class BannerRepositoryImpl implements BannerRepository {
  final BannerService _bannerService;
  
  BannerRepositoryImpl(this._bannerService);

  @override
  Future<void> createBanner(CreateBannerReq req) {
    return _bannerService.createBanner(req);
  }

  @override
  Future<List<Banner>> getBanners() {
    return _bannerService.getBanners()
      .then((e) => e.map((e) => e.toBanner()).toList());
  }
}
