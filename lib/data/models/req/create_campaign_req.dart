import 'package:json_annotation/json_annotation.dart';
import 'package:zentrio_admin/data/models/req/create_budget_req.dart';

part 'create_campaign_req.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CreateCampaignReq {
  final String? name;
  final String? description;
  final String? campaignIdentifier;
  final CreateBudgetReq? budget;
  final String? startsAt;
  final String? endsAt;

  CreateCampaignReq({
    this.name,
    this.description,
    this.campaignIdentifier,
    this.budget,
    this.startsAt,
    this.endsAt,
  });

  factory CreateCampaignReq.fromJson(Map<String, dynamic> json) =>
      _$CreateCampaignReqFromJson(json);

  Map<String, dynamic> toJson() => _$CreateCampaignReqToJson(this);
}
