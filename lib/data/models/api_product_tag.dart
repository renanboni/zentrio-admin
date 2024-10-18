
import 'package:json_annotation/json_annotation.dart';

part 'api_product_tag.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ApiProductTag {
  final String? id;
  final String? value;
  final Map<String, dynamic>? metadata;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;

  ApiProductTag({
    this.id,
    this.value,
    this.metadata,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory ApiProductTag.fromJson(Map<String, dynamic> json) => _$ApiProductTagFromJson(json);

  Map<String, dynamic> toJson() => _$ApiProductTagToJson(this);
}