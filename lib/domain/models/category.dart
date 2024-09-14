import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String? id;
  final String name;
  final String description;
  final String handle;
  final bool isActive;
  final bool isInternal;
  final int rank;
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
      );

  Category copyWith({
    String? id,
    String? name,
    String? description,
    String? handle,
    bool? isActive,
    bool? isInternal,
    int? rank,
    bool? isNew,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
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
    );
  }

  @override
  List<Object?> get props => [
        rank,
      ];
}
