
import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/domain/models/media_file.dart';

@Injectable()
class CreateBannerViewModel {
  final Signal<MediaFile> image = Signal(MediaFile.empty());
  final Signal<MediaFile> mobileImage = Signal(MediaFile.empty());

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
