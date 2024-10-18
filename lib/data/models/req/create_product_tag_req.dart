
import 'package:json_annotation/json_annotation.dart';

part 'create_product_tag_req.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CreateProductTagReq {
  final String? value;

  CreateProductTagReq({
    required this.value,
  });

  factory CreateProductTagReq.fromJson(Map<String, dynamic> json) => _$CreateProductTagReqFromJson(json);

  Map<String, dynamic> toJson() => _$CreateProductTagReqToJson(this);
}
