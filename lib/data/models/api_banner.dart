
import 'package:json_annotation/json_annotation.dart';
import 'package:zentrio_admin/data/models/api_banner_image.dart';

part 'api_banner.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ApiBanner {
  final String? id;
  final String? ctaText;
  final String? ctaLink;
  final String? thumbnail;
  final bool? enabled;
  final List<ApiBannerImage>? images;

  ApiBanner({
    required this.id,
    required this.ctaText,
    required this.ctaLink,
    required this.thumbnail,
    required this.enabled,
    required this.images,
  });

  factory ApiBanner.fromJson(Map<String, dynamic> json) => _$ApiBannerFromJson(json);

  Map<String, dynamic> toJson() => _$ApiBannerToJson(this);
}