
import 'package:equatable/equatable.dart';

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
  final num height;
  final num length;
  final String originCountry;
  final String hsCode;
  final String midCode;
  final String material;
  final String typeId;
  final bool discountable;
  final String externalId;
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
  });

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
    height,
    length,
    originCountry,
    hsCode,
    midCode,
    material,
    typeId,
    discountable,
    externalId,
    createdAt,
    updatedAt,
    deletedAt,
  ];
}