
import 'package:json_annotation/json_annotation.dart';
import 'package:zentrio_admin/data/models/api_product_type.dart';

import 'api_paginated_response.dart';

part 'product_type_response.g.dart';

@JsonSerializable()
class ProductTypeResponse extends ApiPaginatedResponse<ApiProductType> {
  ProductTypeResponse({
    required super.count,
    required super.offset,
    required super.limit,
    required super.data,
  });

  factory ProductTypeResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductTypeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductTypeResponseToJson(this);
}
