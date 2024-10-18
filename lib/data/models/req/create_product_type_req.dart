
import 'package:json_annotation/json_annotation.dart';

part 'create_product_type_req.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CreateProductTypeReq {
  final String? value;

  CreateProductTypeReq({
    required this.value,
  });

  factory CreateProductTypeReq.fromJson(Map<String, dynamic> json) => _$CreateProductTypeReqFromJson(json);

  Map<String, dynamic> toJson() => _$CreateProductTypeReqToJson(this);
}