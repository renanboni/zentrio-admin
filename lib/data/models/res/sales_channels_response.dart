
import 'package:json_annotation/json_annotation.dart';
import 'package:zentrio_admin/data/models/api_sales_channel.dart';
import 'package:zentrio_admin/data/models/res/api_paginated_response.dart';

part 'sales_channels_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SalesChannelsResponse extends ApiPaginatedResponse<ApiSalesChannel> {
  SalesChannelsResponse({
    required super.count,
    required super.offset,
    required super.limit,
    required super.data,
  });

  factory SalesChannelsResponse.fromJson(Map<String, dynamic> json) => _$SalesChannelsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SalesChannelsResponseToJson(this);
}