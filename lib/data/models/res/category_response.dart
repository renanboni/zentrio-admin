
import 'package:json_annotation/json_annotation.dart';
import 'package:zentrio_admin/data/models/api_category.dart';

part 'category_response.g.dart';

@JsonSerializable()
class CategoryResponse {
  final ApiCategory category;

  CategoryResponse(
    this.category,
  );

  factory CategoryResponse.fromJson(Map<String, dynamic> json) => _$CategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryResponseToJson(this);
}