import 'package:json_annotation/json_annotation.dart';
import 'package:zentrio_admin/data/models/api_product.dart';

part 'products_response.g.dart';

@JsonSerializable()
class ProductsResponse {
  final List<ApiProduct> products;

  ProductsResponse(
    this.products,
  );

  factory ProductsResponse.fromJson(Map<String, dynamic> json) => _$ProductsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsResponseToJson(this);
}
