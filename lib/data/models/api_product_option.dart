import 'package:json_annotation/json_annotation.dart';
import 'package:zentrio_admin/data/models/api_product_option_value.dart';

part 'api_product_option.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ApiProductOption {
  final String? id;
  final String? title;
  final String? productId;
  final List<ApiProductOptionValue>? values;
  Map<String, dynamic>? metadata;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  ApiProductOption({
    required this.id,
    required this.title,
    required this.productId,
    required this.values,
    required this.metadata,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory ApiProductOption.fromJson(Map<String, dynamic> json) =>
      _$ApiProductOptionFromJson(json);

  Map<String, dynamic> toJson() => _$ApiProductOptionToJson(this);
}