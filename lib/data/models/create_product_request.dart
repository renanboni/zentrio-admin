import 'package:json_annotation/json_annotation.dart';
import 'package:zentrio_admin/data/models/api_file.dart';
import 'package:zentrio_admin/data/models/api_product_option.dart';
import 'package:zentrio_admin/data/models/req/create_category_req.dart';

import 'create_product_option_req.dart';

part 'create_product_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CreateProductRequest {
  final String? id;
  final String? title;
  final String? handle;
  final String? description;
  final String? subtitle;
  final bool? isGiftcard;
  final String? status;
  final String? thumbnail;
  final List<CreateProductOptionRequest>? options;
  final List<CreateCategoryRequest>? categories;
  final List<ApiFile>? images;
  final num? weight;
  final num? width;
  final num? height;
  final num? length;
  final String? originCountry;
  final String? hsCode;
  final String? midCode;
  final String? material;
  final String? typeId;
  final bool? discountable;
  final String? externalId;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;

  CreateProductRequest({
    this.id,
    this.title,
    this.handle,
    this.description,
    this.subtitle,
    this.isGiftcard,
    this.status,
    this.thumbnail,
    this.weight,
    this.width,
    this.height,
    this.length,
    this.originCountry,
    this.hsCode,
    this.midCode,
    this.material,
    this.typeId,
    this.discountable,
    this.externalId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.options,
    this.images,
    this.categories,
  });

  factory CreateProductRequest.fromJson(Map<String, dynamic> json) => _$CreateProductRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateProductRequestToJson(this);
}
