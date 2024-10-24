
import 'package:json_annotation/json_annotation.dart';

part 'create_category_req.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CreateCategoryRequest {
  final String? id;
  final String? name;
  final String? description;
  final String? handle;
  final bool? isActive;
  final bool? isInternal;
  final int? rank;

  CreateCategoryRequest({
    this.id,
    this.name,
    this.description,
    this.handle,
    this.isActive,
    this.isInternal,
    this.rank,
  });

  factory CreateCategoryRequest.fromJson(Map<String, dynamic> json) => _$CreateCategoryRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateCategoryRequestToJson(this);

  @override
  String toString() {
    return 'CreateCategoryRequest{id: $id, name: $name, description: $description, handle: $handle, isActive: $isActive, isInternal: $isInternal, rank: $rank}';
  }
}