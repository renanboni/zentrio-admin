import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String id;
  final String name;
  final String description;
  final String handle;
  final bool isActive;
  final bool isInternal;
  final int rank;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  const Category({
    required this.id,
    required this.name,
    required this.description,
    required this.handle,
    required this.isActive,
    required this.isInternal,
    required this.rank,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

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
      ];
}
