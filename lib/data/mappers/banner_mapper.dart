import 'package:zentrio_admin/domain/models/banner_image.dart';

import '../../domain/models/Banner.dart';
import '../models/api_banner.dart';

extension ApiBannerMapper on ApiBanner {
  Banner toBanner() {
    return Banner(
      id: id ?? '',
      ctaText: ctaText ?? '',
      ctaLink: ctaLink ?? '',
      thumbnail: thumbnail ?? '',
      enabled: enabled ?? false,
      images: images
              ?.map(
                (e) => BannerImage(
                  id: e.id ?? '',
                  position: e.position ?? 0,
                  isMobile: e.isMobile ?? false,
                  url: '',
                ),
              )
              .toList() ??
          [],
    );
  }
}
