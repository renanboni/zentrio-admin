
import 'package:json_annotation/json_annotation.dart';
import 'package:zentrio_admin/data/models/api_collection.dart';

part 'collections_response.g.dart';

@JsonSerializable()
class CollectionsResponse {
  final List<ApiCollection>? collections;

  CollectionsResponse({required this.collections});

  factory CollectionsResponse.fromJson(Map<String, dynamic> json) => _$CollectionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionsResponseToJson(this);
}
