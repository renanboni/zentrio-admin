
import 'package:json_annotation/json_annotation.dart';
import 'package:zentrio_admin/data/models/api_product_tag.dart';

import 'api_paginated_response.dart';

part 'product_tag_response.g.dart';

@JsonSerializable()
class ProductTagResponse extends ApiPaginatedResponse<ApiProductTag> {
  ProductTagResponse({
    required super.count,
    required super.offset,
    required super.limit,
    required super.data,
  });

  factory ProductTagResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductTagResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductTagResponseToJson(this);
}
