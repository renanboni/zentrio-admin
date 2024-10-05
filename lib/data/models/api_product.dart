import 'package:json_annotation/json_annotation.dart';
import 'package:zentrio_admin/data/models/api_category.dart';
import 'package:zentrio_admin/data/models/api_collection.dart';
import 'package:zentrio_admin/data/models/api_file.dart';
import 'package:zentrio_admin/data/models/api_product_option.dart';
import 'package:zentrio_admin/data/models/api_product_type.dart';

import 'api_product_tag.dart';

part 'api_product.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class ApiProduct {
  final String? id;
  final String? title;
  final String? handle;
  final String? description;
  final String? subtitle;
  final bool? isGiftcard;
  final String? status;
  final String? thumbnail;
  final List<ApiProductOption>? options;
  final List<ApiFile>? images;
  final String? weight;
  final String? width;
  final String? height;
  final String? length;
  final String? originCountry;
  final String? hsCode;
  final String? midCode;
  final String? material;
  final String? typeId;
  final bool? discountable;
  final String? externalId;
  final ApiCollection? collection;
  final ApiProductType? type;
  final List<ApiProductTag>? tags;
  final List<ApiCategory> categories;
  final Map<String, Object>? metadata;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;

  ApiProduct({
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
    this.collection,
    this.type,
    this.tags,
    this.metadata,
    this.categories = const [],
  });

  factory ApiProduct.fromJson(Map<String, dynamic> json) => _$ApiProductFromJson(json);

  Map<String, dynamic> toJson() => _$ApiProductToJson(this);
}
