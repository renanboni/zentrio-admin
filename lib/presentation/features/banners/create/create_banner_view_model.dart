import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/data/models/api_banner_image.dart';
import 'package:zentrio_admin/domain/models/media_file.dart';
import 'package:zentrio_admin/domain/usecase/banner_usecase.dart';
import 'package:collection/collection.dart';

import '../../../../data/models/req/create_banner_req.dart';

@Injectable()
class CreateBannerViewModel {
  final ListSignal<MediaFile> image = ListSignal([]);
  final ListSignal<MediaFile> mobileImage = ListSignal([]);
  final Signal<String> cta = Signal('');
  final Signal<String> ctaLink = Signal('');
  final Signal<bool> enabled = Signal(false);

  final BannerUseCase _bannerUseCase;

  CreateBannerViewModel(
    this._bannerUseCase,
  );

  void onSave(
    VoidCallback onSuccess,
    VoidCallback onError,
  ) async {
    try {
      final uploadedFile = await _bannerUseCase.uploadFiles(image.value);
      //final uploadedMobileFile = await _bannerUseCase.uploadFiles(mobileImage.value);

      final banner = CreateBannerReq(
        ctaText: cta.value,
        ctaLink: ctaLink.value,
        enabled: enabled.value,
        images: uploadedFile.mapIndexed(
          (index, e) => ApiBannerImage(
            fileId: e.id,
            position: index,
            isMobile: false,
            mimeType: "png"
          ),
        ).toList()/* + uploadedMobileFile.mapIndexed(
          (index, e) => ApiBannerImage(
            fileId: e.id,
            position: index,
            isMobile: true,
            mimeType: "png"
          ),
        ).toList()*/,
      );

      await _bannerUseCase.createBanner(banner);
      onSuccess();
    } catch (e) {
      onError();
      print(e);
    }
  }

  void onAddImages(List<MediaFile> files) {
    image.addAll(files);
  }

  void onDeleteImage(int index) {
    image.removeAt(index);
  }

  void onAddMobileImages(List<MediaFile> files) {
    mobileImage.addAll(files);
  }

  void onDeleteMobileImage(int index) {
    mobileImage.removeAt(index);
  }
}
