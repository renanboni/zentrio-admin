
import 'package:json_annotation/json_annotation.dart';

part 'api_category.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ApiCategory {
  final String? id;
  final String? name;
  final String? description;
  final String? handle;
  final bool? isActive;
  final bool? isInternal;
  final int? rank;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;

  ApiCategory(
    this.id,
    this.name,
    this.description,
    this.handle,
    this.isActive,
    this.isInternal,
    this.rank,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  );

  factory ApiCategory.fromJson(Map<String, dynamic> json) {
    return ApiCategory(
      json['id'],
      json['name'],
      json['description'],
      json['handle'],
      json['is_active'],
      json['is_internal'],
      json['rank'],
      json['created_at'],
      json['updated_at'],
      json['deleted_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'handle': handle,
      'is_active': isActive,
      'is_internal': isInternal,
      'rank': rank,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
    };
  }
}