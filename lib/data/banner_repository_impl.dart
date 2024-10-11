import 'package:dio/dio.dart';
import 'package:zentrio_admin/data/mappers/banner_mapper.dart';
import 'package:zentrio_admin/data/mappers/file_mapper.dart';
import 'package:zentrio_admin/data/models/req/create_banner_req.dart';
import 'package:zentrio_admin/data/remote/banner_service.dart';
import 'package:zentrio_admin/domain/models/Banner.dart';

import '../domain/models/media_file.dart';
import '../domain/models/medusa_file.dart';
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
    return _bannerService
        .getBanners()
        .then((e) => e.map((e) => e.toBanner()).toList());
  }

  @override
  Future<List<MedusaFile>> uploadFiles(List<MediaFile> files) {
    final multipartFiles = files
        .map(
          (e) => MultipartFile.fromBytes(
            e.bytes ?? [],
            filename: e.name,
            contentType: DioMediaType.parse(e.mimeType),
          ),
        )
        .toList();

    return _bannerService
        .upload(multipartFiles)
        .then((value) => value.files.map((e) => e.toMediaFile()).toList());
  }
}
