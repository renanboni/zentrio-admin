
import 'package:json_annotation/json_annotation.dart';

part 'api_collection.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ApiCollection {
  final String? id;
  final String? title;
  final String? handle;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;

  ApiCollection({
    this.id,
    this.title,
    this.handle,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory ApiCollection.fromJson(Map<String, dynamic> json) => _$ApiCollectionFromJson(json);

  Map<String, dynamic> toJson() => _$ApiCollectionToJson(this);
}
