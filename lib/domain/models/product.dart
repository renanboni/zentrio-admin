import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:zentrio_admin/domain/models/category.dart';
import 'package:zentrio_admin/domain/models/collection.dart';
import 'package:zentrio_admin/domain/models/medusa_file.dart';
import 'package:zentrio_admin/domain/models/metadata.dart';
import 'package:zentrio_admin/domain/models/product_option.dart';
import 'package:zentrio_admin/domain/models/product_tag.dart';
import 'package:zentrio_admin/domain/models/product_type.dart';

part 'product.g.dart';

@JsonSerializable()
class Product extends Equatable {
  final String id;
  final String title;
  final String handle;
  final String description;
  final String subtitle;
  final bool isGiftcard;
  final String status;
  final String thumbnail;
  final String weight;
  final String width;
  final String height;
  final String length;
  final String originCountry;
  final String hsCode;
  final String midCode;
  final String material;
  final String typeId;
  final bool discountable;
  final String externalId;
  final List<ProductOption> options;
  final List<MedusaFile> images;
  final ProductType type;
  final List<ProductTag> tags;
  final Collection collection;
  final List<Category> categories;
  final List<Metadata> metadata;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  const Product({
    required this.id,
    required this.title,
    required this.handle,
    required this.description,
    required this.subtitle,
    required this.isGiftcard,
    required this.status,
    required this.thumbnail,
    required this.weight,
    required this.width,
    required this.height,
    required this.length,
    required this.originCountry,
    required this.hsCode,
    required this.midCode,
    required this.material,
    required this.typeId,
    required this.discountable,
    required this.externalId,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.options,
    required this.images,
    required this.type,
    required this.tags,
    required this.collection,
    required this.categories,
    required this.metadata,
  });

  factory Product.empty() {
    return Product(
      id: '',
      title: '',
      handle: '',
      description: '',
      subtitle: '',
      isGiftcard: false,
      status: '',
      thumbnail: '',
      weight: '',
      width: '',
      height: '',
      length: '',
      originCountry: '',
      hsCode: '',
      midCode: '',
      material: '',
      typeId: '',
      discountable: false,
      externalId: '',
      options: const [],
      images: const [],
      type: ProductType.empty(),
      collection: Collection.empty(),
      metadata: const [],
      tags: const [],
      categories: const [],
      createdAt: null,
      updatedAt: null,
      deletedAt: null,
    );
  }

  Product copyWith({
    String? id,
    String? title,
    String? handle,
    String? description,
    String? subtitle,
    bool? isGiftcard,
    String? status,
    String? thumbnail,
    String? weight,
    String? width,
    String? height,
    String? length,
    String? originCountry,
    String? hsCode,
    String? midCode,
    String? material,
    String? typeId,
    bool? discountable,
    String? externalId,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    List<ProductOption>? options,
    List<MedusaFile>? images,
    ProductType? type,
    List<ProductTag>? tags,
    Collection? collection,
    List<Category>? categories,
    List<Metadata>? metadata,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      handle: handle ?? this.handle,
      description: description ?? this.description,
      subtitle: subtitle ?? this.subtitle,
      isGiftcard: isGiftcard ?? this.isGiftcard,
      status: status ?? this.status,
      thumbnail: thumbnail ?? this.thumbnail,
      weight: weight ?? this.weight,
      width: width ?? this.width,
      height: height ?? this.height,
      length: length ?? this.length,
      originCountry: originCountry ?? this.originCountry,
      hsCode: hsCode ?? this.hsCode,
      midCode: midCode ?? this.midCode,
      material: material ?? this.material,
      typeId: typeId ?? this.typeId,
      discountable: discountable ?? this.discountable,
      externalId: externalId ?? this.externalId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      options: options ?? this.options,
      images: images ?? this.images,
      type: type ?? this.type,
      tags: tags ?? this.tags,
      collection: collection ?? this.collection,
      categories: categories ?? this.categories,
      metadata: metadata ?? this.metadata,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        handle,
        description,
        subtitle,
        isGiftcard,
        status,
        thumbnail,
        weight,
        width,
        height,
        length,
        originCountry,
        hsCode,
        midCode,
        material,
        typeId,
        discountable,
        externalId,
        options,
        images,
        type,
        tags,
        metadata,
        categories,
        collection,
        createdAt,
        updatedAt,
        deletedAt,
      ];

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}
