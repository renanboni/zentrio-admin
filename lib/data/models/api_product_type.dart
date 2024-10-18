
import 'package:json_annotation/json_annotation.dart';

part 'api_product_type.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ApiProductType {
  final String? id;
  final String? value;
  final Map<String, dynamic>? metadata;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;

  ApiProductType({
    this.id,
    this.value,
    this.metadata,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory ApiProductType.fromJson(Map<String, dynamic> json) => _$ApiProductTypeFromJson(json);

  Map<String, dynamic> toJson() => _$ApiProductTypeToJson(this);
}