
import 'package:json_annotation/json_annotation.dart';

part 'update_category_req.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class UpdateCategoryRequest {
  final String? name;
  final String? handle;
  final String? description;
  final bool? isActive;
  final bool? isInternal;

  UpdateCategoryRequest({
    required this.name,
    required this.handle,
    required this.description,
    required this.isActive,
    required this.isInternal,
  });

  factory UpdateCategoryRequest.fromJson(Map<String, dynamic> json) => _$UpdateCategoryRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateCategoryRequestToJson(this);
}