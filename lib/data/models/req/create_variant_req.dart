
import 'package:json_annotation/json_annotation.dart';

part 'create_variant_req.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CreateVariantRequest {
  final String title;
  final String sku;
  final bool manageInventory;
  final bool allowBackorders;
  final Map<String, String> options;

  CreateVariantRequest({
    required this.title,
    required this.sku,
    required this.manageInventory,
    required this.allowBackorders,
    required this.options,
  });

  factory CreateVariantRequest.fromJson(Map<String, dynamic> json) => _$CreateVariantRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateVariantRequestToJson(this);
}
