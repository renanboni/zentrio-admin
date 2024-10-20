
import 'package:json_annotation/json_annotation.dart';
import 'package:zentrio_admin/data/models/api_collection.dart';

import 'api_paginated_response.dart';

part 'collections_response.g.dart';

@JsonSerializable()
class CollectionsResponse extends ApiPaginatedResponse<ApiCollection> {
  CollectionsResponse({
    required super.count,
    required super.offset,
    required super.limit,
    required super.data,
  });

  factory CollectionsResponse.fromJson(Map<String, dynamic> json) =>
      _$CollectionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionsResponseToJson(this);
}
