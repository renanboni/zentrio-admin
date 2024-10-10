
import 'package:json_annotation/json_annotation.dart';

part 'api_banner.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ApiBanner {
  final String? id;
  final String? image;
  final String? imageMobile;
  final String? cta;
  final String? ctaLink;
  final int? position;

  ApiBanner({
    required this.id,
    required this.image,
    required this.imageMobile,
    required this.cta,
    required this.ctaLink,
    required this.position,
  });

  factory ApiBanner.fromJson(Map<String, dynamic> json) => _$ApiBannerFromJson(json);

  Map<String, dynamic> toJson() => _$ApiBannerToJson(this);
}