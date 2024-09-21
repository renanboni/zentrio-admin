
import 'package:json_annotation/json_annotation.dart';

part 'create_category_req.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
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
    required this.name,
    required this.description,
    required this.handle,
    required this.isActive,
    required this.isInternal,
    required this.rank,
  });

  factory CreateCategoryRequest.fromJson(Map<String, dynamic> json) => _$CreateCategoryRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateCategoryRequestToJson(this);
}