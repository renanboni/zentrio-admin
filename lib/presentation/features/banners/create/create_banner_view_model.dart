import 'dart:typed_data';
import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/domain/models/media_file.dart';
import 'package:zentrio_admin/domain/usecase/banner_usecase.dart';
import 'package:zentrio_admin/domain/usecase/file_usecase.dart';

import '../../../../data/models/req/create_banner_req.dart';

@Injectable()
class CreateBannerViewModel {
  final Signal<MediaFile> image = Signal(MediaFile.empty());
  final Signal<MediaFile> mobileImage = Signal(MediaFile.empty());
  final Signal<String> cta = Signal('');
  final Signal<String> ctaLink = Signal('');

  final BannerUseCase _bannerUseCase;
  final FileUseCase _fileUseCase;

  CreateBannerViewModel(
    this._bannerUseCase,
    this._fileUseCase,
  );

  void onSave(
    VoidCallback onSuccess,
    VoidCallback onError,
  ) async {
    final imageFile = image.value;
    final mobileImageFile = mobileImage.value;
    final ctaValue = cta.value;
    final ctaLinkValue = ctaLink.value;

    try {
      final bytes = [
        imageFile.bytes ?? Uint8List(0),
        mobileImageFile.bytes ?? Uint8List(0)
      ];
      final uploadedFile = await _fileUseCase.uploadBytes(bytes);

      final banner = CreateBannerReq(
          image: uploadedFile[0].url,
          cta: ctaValue,
          ctaLink: ctaLinkValue,
          position: 0);

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
