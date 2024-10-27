
import '../../domain/models/campaign.dart';
import '../models/api_campaign.dart';

extension ApiCampaignMapper on ApiCampaign {
  Campaign toCampaign() {
    return Campaign(
      id: id ?? '',
      name: name ?? '',
      description: description ?? '',
      campaignIdentifier: campaignIdentifier ?? '',
      startsAt: startsAt ?? '',
      endsAt: endsAt ?? '',
    );
  }
}
