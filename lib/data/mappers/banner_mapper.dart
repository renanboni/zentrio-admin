
import '../../domain/models/Banner.dart';
import '../models/api_banner.dart';

extension ApiBannerMapper on ApiBanner {
  Banner toBanner() {
    return Banner(
      id: id ?? '',
      image: image ?? '',
      imageMobile: imageMobile ?? '',
      cta: cta ?? '',
      ctaLink: ctaLink ?? '',
      position: position ?? 0,
    );
  }
}
