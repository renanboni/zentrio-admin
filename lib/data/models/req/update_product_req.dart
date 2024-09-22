
import 'package:json_annotation/json_annotation.dart';

part 'update_product_req.g.dart';

@JsonSerializable(includeIfNull: false)
class UpdateProductReq {
  final String? status;
  final String? title;
  final String? subtitle;
  final String? handle;
  final String? material;
  final String? description;
  final bool? discountable;

  UpdateProductReq({
    required this.status,
    required this.title,
    required this.subtitle,
    required this.handle,
    required this.material,
    required this.description,
    required this.discountable,
  });

  factory UpdateProductReq.fromJson(Map<String, dynamic> json) => _$UpdateProductReqFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProductReqToJson(this);
}
