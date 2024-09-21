import 'package:json_annotation/json_annotation.dart';
import 'package:zentrio_admin/data/models/api_product.dart';

part 'product_response.g.dart';

@JsonSerializable()
class ProductResponse {
  final ApiProduct product;

  ProductResponse(
    this.product,
  );

  factory ProductResponse.fromJson(Map<String, dynamic> json) => _$ProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}
