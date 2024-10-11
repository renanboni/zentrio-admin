
import 'package:json_annotation/json_annotation.dart';
import 'package:zentrio_admin/data/models/api_banner_image.dart';

part 'create_banner_req.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CreateBannerReq {
  final String? ctaText;
  final String? ctaLink;
  final bool? enabled;
  final List<ApiBannerImage>? images;

  CreateBannerReq({
    this.ctaText,
    this.ctaLink,
    this.images,
    this.enabled,
  });

  factory CreateBannerReq.fromJson(Map<String, dynamic> json) => _$CreateBannerReqFromJson(json);

  Map<String, dynamic> toJson() => _$CreateBannerReqToJson(this);
}