import 'package:json_annotation/json_annotation.dart';
import 'package:zentrio_admin/data/models/api_file.dart';
import 'package:zentrio_admin/data/models/api_product_option.dart';
import 'package:zentrio_admin/data/models/req/create_category_req.dart';

part 'create_collection_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CreateCollectionRequest {
  final String? id;
  final String? title;
  final String? handle;

  CreateCollectionRequest({
    this.id,
    this.title,
    this.handle,
  });

  factory CreateCollectionRequest.fromJson(Map<String, dynamic> json) => _$CreateCollectionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateCollectionRequestToJson(this);
}
