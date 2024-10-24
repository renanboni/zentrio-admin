import 'package:json_annotation/json_annotation.dart';

part 'api_variant.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ApiVariant {
  final String? id;
  final String? title;
  final String? sku;
  final String? barcode;
  final String? ean;
  final String? upc;
  final bool? allowBackorder;
  final bool? manageInventory;
  final String? hsCode;
  final String? originCountry;
  final String? midCode;
  final String? material;
  final String? weight;
  final String? length;
  final String? height;
  final String? width;
  final Map<String, String>? metadata;
  final int? variantRank;
  final String? productId;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;

  ApiVariant({
    required this.id,
    required this.title,
    required this.sku,
    required this.barcode,
    required this.ean,
    required this.upc,
    required this.allowBackorder,
    required this.manageInventory,
    required this.hsCode,
    required this.originCountry,
    required this.midCode,
    required this.material,
    required this.weight,
    required this.length,
    required this.height,
    required this.width,
    required this.metadata,
    required this.variantRank,
    required this.productId,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory ApiVariant.fromJson(Map<String, dynamic> json) =>
      _$ApiVariantFromJson(json);

  Map<String, dynamic> toJson() => _$ApiVariantToJson(this);
}