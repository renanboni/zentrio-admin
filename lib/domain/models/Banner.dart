import 'package:equatable/equatable.dart';
import 'package:zentrio_admin/domain/models/banner_image.dart';

class Banner extends Equatable {
  final String id;
  final String ctaText;
  final String ctaLink;
  final bool enabled;
  final String thumbnail;
  final List<BannerImage> images;

  const Banner({
    required this.id,
    required this.ctaText,
    required this.ctaLink,
    required this.enabled,
    required this.thumbnail,
    required this.images,
  });

  @override
  List<Object?> get props => [id, ctaText, ctaLink, enabled, images, thumbnail];
}
