
import 'package:equatable/equatable.dart';

class BannerImage extends Equatable {
  final String id;
  final int position;
  final bool isMobile;
  final String url;

  const BannerImage({
    required this.id,
    required this.position,
    required this.isMobile,
    required this.url,
  });

  @override
  List<Object?> get props => [id, position, isMobile, url];
}