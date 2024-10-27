import 'package:zentrio_admin/data/mappers/campaign_mapper.dart';
import 'package:zentrio_admin/data/models/req/create_campaign_req.dart';
import 'package:zentrio_admin/data/remote/promotion_service.dart';
import 'package:zentrio_admin/domain/models/campaign.dart';
import 'package:zentrio_admin/domain/models/paginated_response.dart';
import 'package:zentrio_admin/domain/repositories/promotion_repository.dart';

class PromotionRepositoryImpl extends PromotionRepository {
  final PromotionService _promotionService;

  PromotionRepositoryImpl(this._promotionService);

  @override
  Future<PaginatedResponse<Campaign>> getCampaigns({
    int limit = 10,
    int offset = 0,
  }) {
    return _promotionService.getAll(limit, offset).then(
      (response) {
        return PaginatedResponse(
          count: response.count ?? 0,
          offset: response.offset ?? 0,
          limit: response.limit ?? 0,
          data: response.data?.map((e) => e.toCampaign()).toList() ?? [],
        );
      },
    );
  }

  @override
  Future<void> createCampaign(CreateCampaignReq req) {
    return _promotionService.createCampaign(req);
  }
}
