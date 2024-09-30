
import 'package:json_annotation/json_annotation.dart';
import 'package:zentrio_admin/data/models/api_product.dart';

part 'api_category.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ApiCategory {
  final String? id;
  final String? name;
  final String? description;
  final String? handle;
  final bool? isActive;
  final bool? isInternal;
  final int? rank;
  final List<ApiProduct>? products;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;

  ApiCategory(
    this.id,
    this.name,
    this.description,
    this.handle,
    this.isActive,
    this.isInternal,
    this.rank,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  );

  factory ApiCategory.fromJson(Map<String, dynamic> json) => _$ApiCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$ApiCategoryToJson(this);
}