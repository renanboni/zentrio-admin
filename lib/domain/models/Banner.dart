import 'package:equatable/equatable.dart';

class Banner extends Equatable {
  final String id;
  final String image;
  final String imageMobile;
  final String cta;
  final String ctaLink;
  final int position;

  const Banner({
    required this.id,
    required this.image,
    required this.imageMobile,
    required this.cta,
    required this.ctaLink,
    required this.position,
  });

  @override
  List<Object?> get props => [id, image, imageMobile, cta, ctaLink, position];
}
