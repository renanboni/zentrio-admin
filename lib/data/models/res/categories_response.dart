
import 'package:json_annotation/json_annotation.dart';
import 'package:zentrio_admin/data/models/api_category.dart';

part 'categories_response.g.dart';

@JsonSerializable()
class CategoriesResponse {
  final List<ApiCategory> categories;

  CategoriesResponse(
    this.categories,
  );

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) => _$CategoriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesResponseToJson(this);
}