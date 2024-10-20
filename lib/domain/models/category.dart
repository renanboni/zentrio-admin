import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:zentrio_admin/domain/models/product.dart';

class Category extends Equatable {
  final String? id;
  final String name;
  final String description;
  final String handle;
  final bool isActive;
  final bool isInternal;
  final int rank;
  final List<Product> products;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final bool isNew;

  const Category({
    this.id,
    required this.name,
    required this.description,
    required this.handle,
    required this.isActive,
    required this.isInternal,
    required this.rank,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.isNew = false,
    this.products = const [],
  });

  factory Category.empty() => const Category(
        id: '',
        name: '',
        description: '',
        handle: '',
        isActive: false,
        isInternal: false,
        rank: 0,
        createdAt: null,
        updatedAt: null,
        deletedAt: null,
        isNew: false,
        products: []
      );

  Category copyWith({
    String? id,
    String? name,
    String? description,
    String? handle,
    bool? isActive,
    bool? isInternal,
    int? rank,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    bool? isNew,
    List<Product>? products,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      handle: handle ?? this.handle,
      isActive: isActive ?? this.isActive,
      isInternal: isInternal ?? this.isInternal,
      rank: rank ?? this.rank,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      isNew: isNew ?? this.isNew,
      products: products ?? this.products,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        handle,
        isActive,
        isInternal,
        rank,
        createdAt,
        updatedAt,
        deletedAt,
        isNew,
        products,
      ];
}
