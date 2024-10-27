
import 'package:json_annotation/json_annotation.dart';

part 'api_campaign.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ApiCampaign {
  final String? id;
  final String? name;
  final String? description;
  final String? campaignIdentifier;
  final String? startsAt;
  final String? endsAt;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;

  ApiCampaign(
    this.id,
    this.name,
    this.description,
    this.campaignIdentifier,
    this.startsAt,
    this.endsAt,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  );

  factory ApiCampaign.fromJson(Map<String, dynamic> json) => _$ApiCampaignFromJson(json);

  Map<String, dynamic> toJson() => _$ApiCampaignToJson(this);
}