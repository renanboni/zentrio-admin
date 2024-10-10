
import 'package:json_annotation/json_annotation.dart';

part 'create_banner_req.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CreateBannerReq {
  final String imageUrl;
  final String? imageMobileUrl;
  final String? ctaText;
  final String? ctaLink;
  final int? position;

  CreateBannerReq({
    required this.imageUrl,
    this.imageMobileUrl,
    this.ctaText,
    this.ctaLink,
    this.position,
  });

  factory CreateBannerReq.fromJson(Map<String, dynamic> json) => _$CreateBannerReqFromJson(json);

  Map<String, dynamic> toJson() => _$CreateBannerReqToJson(this);
}