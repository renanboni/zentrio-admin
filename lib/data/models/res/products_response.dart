import 'package:json_annotation/json_annotation.dart';
import 'package:zentrio_admin/data/models/api_product.dart';

import 'api_paginated_response.dart';

part 'products_response.g.dart';

@JsonSerializable()
class ProductsResponse extends ApiPaginatedResponse<ApiProduct> {
  ProductsResponse({
    required super.count,
    required super.offset,
    required super.limit,
    required super.data,
  });

  factory ProductsResponse.fromJson(Map<String, dynamic> json) => _$ProductsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsResponseToJson(this);
}
