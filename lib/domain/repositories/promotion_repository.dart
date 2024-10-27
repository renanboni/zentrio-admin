
import 'package:zentrio_admin/domain/models/paginated_response.dart';

import '../../data/models/req/create_campaign_req.dart';
import '../models/campaign.dart';

abstract class PromotionRepository {
  Future<PaginatedResponse<Campaign>> getCampaigns({int limit = 10, int offset = 0});

  Future<void> createCampaign(CreateCampaignReq req);
}