
import 'package:json_annotation/json_annotation.dart';

part 'update_product_organization_req.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class UpdateProductOrganizationReq {
  final String? type;
  final String? collection;
  final List<String>? categories;
  final List<String>? tags;

  UpdateProductOrganizationReq({
    this.type,
    this.collection,
    this.categories,
    this.tags,
  });

  factory UpdateProductOrganizationReq.fromJson(Map<String, dynamic> json) => _$UpdateProductOrganizationReqFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProductOrganizationReqToJson(this);
}