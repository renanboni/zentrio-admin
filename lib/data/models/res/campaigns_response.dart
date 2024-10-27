import 'package:json_annotation/json_annotation.dart';

import '../api_campaign.dart';
import 'api_paginated_response.dart';

part 'campaigns_response.g.dart';

@JsonSerializable()
class CampaignsResponse extends ApiPaginatedResponse<ApiCampaign> {
  CampaignsResponse({
    required super.count,
    required super.offset,
    required super.limit,
    required super.data,
  });

  factory CampaignsResponse.fromJson(Map<String, dynamic> json) =>
      _$CampaignsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CampaignsResponseToJson(this);
}
