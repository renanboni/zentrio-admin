import 'package:json_annotation/json_annotation.dart';
import 'package:zentrio_admin/data/models/api_category.dart';

import 'api_paginated_response.dart';

part 'categories_response.g.dart';

@JsonSerializable()
class CategoriesResponse extends ApiPaginatedResponse<ApiCategory> {
  CategoriesResponse({
    required super.count,
    required super.offset,
    required super.limit,
    required super.data,
  });

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesResponseToJson(this);
}
