
import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/domain/usecase/banner_usecase.dart';

import '../../../domain/models/Banner.dart';

@injectable
class BannersViewModel {
  final BannerUseCase _bannerUseCase;

  final ListSignal<Banner> banners = ListSignal<Banner>([]);

  BannersViewModel(this._bannerUseCase) {
    _getBanners();
  }

  _getBanners() async {
    try {
      final result = await _bannerUseCase.getBanners();
      banners.value = result;
    } catch (e) {
      print(e);
    }
  }
}