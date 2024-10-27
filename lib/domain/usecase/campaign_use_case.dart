import 'package:injectable/injectable.dart';
import 'package:zentrio_admin/data/models/req/create_campaign_req.dart';
import 'package:zentrio_admin/domain/models/paginated_response.dart';
import 'package:zentrio_admin/domain/repositories/promotion_repository.dart';

import '../models/campaign.dart';

@Injectable()
class PromotionUseCase {
  final PromotionRepository repository;

  PromotionUseCase(this.repository);

  Future<PaginatedResponse<Campaign>> getCampaigns({
    int limit = 10,
    int offset = 0,
  }) {
    return repository.getCampaigns(
      limit: limit,
      offset: offset,
    );
  }

  Future<void> createCampaign(CreateCampaignReq req) {
    return repository.createCampaign(req);
  }
}
