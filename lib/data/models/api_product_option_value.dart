
import 'package:json_annotation/json_annotation.dart';

part 'api_product_option_value.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ApiProductOptionValue {
  String? id;
  String? value;
  String? optionId;
  Map<String, dynamic>? metadata;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  ApiProductOptionValue({
    required this.id,
    required this.value,
    required this.optionId,
    required this.metadata,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory ApiProductOptionValue.fromJson(Map<String, dynamic> json) => _$ApiProductOptionValueFromJson(json);

  Map<String, dynamic> toJson() => _$ApiProductOptionValueToJson(this);
}
