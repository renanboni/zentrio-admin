
import 'package:json_annotation/json_annotation.dart';

import '../create_price_req.dart';

part 'create_variant_req.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CreateVariantRequest {
  final String? id;
  final String? title;
  final String? sku;
  final String? barcode;
  final String? ean;
  final String? upc;
  final bool? allowBackorder;
  final bool? manageInventory;
  final String? hsCode;
  final String? material;
  final num? weight;
  final num? width;
  final num? height;
  final num? length;
  final Map<String, String>? options;
  final List<CreatePriceReq>? prices;

  CreateVariantRequest({
    this.id,
    this.title,
    this.sku,
    this.barcode,
    this.ean,
    this.upc,
    this.allowBackorder,
    this.manageInventory,
    this.hsCode,
    this.material,
    this.weight,
    this.width,
    this.height,
    this.length,
    this.options,
    this.prices,
  });

  factory CreateVariantRequest.fromJson(Map<String, dynamic> json) => _$CreateVariantRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateVariantRequestToJson(this);
}
