
import 'package:json_annotation/json_annotation.dart';

part 'create_product_option_req.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CreateProductOptionRequest {
  String? title;
  List<String>? values;

  CreateProductOptionRequest({
    this.title,
    this.values,
  });

  factory CreateProductOptionRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateProductOptionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateProductOptionRequestToJson(this);
}