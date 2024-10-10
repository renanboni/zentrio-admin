
import 'package:zentrio_admin/data/models/req/create_banner_req.dart';
import 'package:zentrio_admin/data/remote/banner_service.dart';
import 'package:zentrio_admin/domain/models/Banner.dart';

import '../domain/repositories/banner_repository.dart';

class BannerRepositoryImpl implements BannerRepository {
  final BannerService _bannerService;
  
  BannerRepositoryImpl(this._bannerService);

  @override
  Future<void> createBanner(CreateBannerReq req) {
    // TODO: implement createBanner
    throw UnimplementedError();
  }

  @override
  Future<List<Banner>> getBanners() {
    // TODO: implement getBanners
    throw UnimplementedError();
  }
}