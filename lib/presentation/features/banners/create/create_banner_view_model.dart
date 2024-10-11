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
  final Signal<MediaFile> image = Signal(MediaFile.empty());
  final Signal<MediaFile> mobileImage = Signal(MediaFile.empty());
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
    final imageFile = image.value;
    final mobileImageFile = mobileImage.value;

    try {
      final uploadedFile = await _bannerUseCase.uploadFiles([imageFile]);

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
        ).toList(),
      );

      await _bannerUseCase.createBanner(banner);
      onSuccess();
    } catch (e) {
      onError();
      print(e);
    }
  }

  void onImageChanged(MediaFile file) {
    image.value = file;
  }

  void onRemoveImage() {
    image.value = MediaFile.empty();
  }

  void onMobileImageChanged(MediaFile file) {
    mobileImage.value = file;
  }

  void onRemoveMobileImage() {
    mobileImage.value = MediaFile.empty();
  }
}
