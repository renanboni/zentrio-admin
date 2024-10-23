import 'package:equatable/equatable.dart';
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
  final bool selected;

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
    this.selected = false,
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
        products: [],
        selected: false,
      );

  Category copyWith({
    String? id,
    String? name,
    String? description,
    String? handle,
    bool? isActive,
    bool? isInternal,
    int? rank,
    List<Product>? products,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    bool? isNew,
    bool? selected,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      handle: handle ?? this.handle,
      isActive: isActive ?? this.isActive,
      isInternal: isInternal ?? this.isInternal,
      rank: rank ?? this.rank,
      products: products ?? this.products,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      isNew: isNew ?? this.isNew,
      selected: selected ?? this.selected,
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
        selected,
      ];
}
