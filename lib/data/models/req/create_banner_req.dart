
import 'package:json_annotation/json_annotation.dart';

part 'create_banner_req.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CreateBannerReq {
  final String image;
  final String? imageMobile;
  final String? cta;
  final String? ctaLink;
  final int? position;

  CreateBannerReq({
    required this.image,
    this.imageMobile,
    this.cta,
    this.ctaLink,
    this.position,
  });

  factory CreateBannerReq.fromJson(Map<String, dynamic> json) => _$CreateBannerReqFromJson(json);

  Map<String, dynamic> toJson() => _$CreateBannerReqToJson(this);
}