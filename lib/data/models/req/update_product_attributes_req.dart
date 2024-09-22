
import 'package:json_annotation/json_annotation.dart';

part 'update_product_attributes_req.g.dart';

@JsonSerializable(includeIfNull: false)
class UpdateProductAttributesReq {
  final num? width;
  final num? height;
  final num? length;
  final num? weight;
  final String? midCode;

  UpdateProductAttributesReq({
    required this.width,
    required this.height,
    required this.length,
    required this.weight,
    required this.midCode,
  });

  factory UpdateProductAttributesReq.fromJson(Map<String, dynamic> json) => _$UpdateProductAttributesReqFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProductAttributesReqToJson(this);
}