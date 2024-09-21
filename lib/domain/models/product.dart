import 'package:equatable/equatable.dart';
import 'package:zentrio_admin/domain/models/medusa_file.dart';
import 'package:zentrio_admin/domain/models/product_option.dart';

class Product extends Equatable {
  final String id;
  final String title;
  final String handle;
  final String description;
  final String subtitle;
  final bool isGiftcard;
  final String status;
  final String thumbnail;
  final num weight;
  final num width;
  final num height;
  final num length;
  final String originCountry;
  final String hsCode;
  final String midCode;
  final String material;
  final String typeId;
  final bool discountable;
  final String externalId;
  final List<ProductOption> options;
  final List<MedusaFile> images;
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
  });

  const Product.empty()
      : id = '',
        title = '',
        handle = '',
        description = '',
        subtitle = '',
        isGiftcard = false,
        status = '',
        thumbnail = '',
        weight = 0,
        width = 0,
        height = 0,
        length = 0,
        originCountry = '',
        hsCode = '',
        midCode = '',
        material = '',
        typeId = '',
        discountable = false,
        externalId = '',
        createdAt = null,
        updatedAt = null,
        deletedAt = null,
        options = const [],
        images = const [];

  Product copyWith({
    String? id,
    String? title,
    String? handle,
    String? description,
    String? subtitle,
    bool? isGiftcard,
    String? status,
    String? thumbnail,
    num? weight,
    num? width,
    num? height,
    num? length,
    String? originCountry,
    String? hsCode,
    String? midCode,
    String? material,
    String? typeId,
    bool? discountable,
    String? externalId,
    List<ProductOption>? options,
    List<MedusaFile>? images,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
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
      options: options ?? this.options,
      images: images ?? this.images,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
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
        createdAt,
        updatedAt,
        deletedAt,
      ];
}
