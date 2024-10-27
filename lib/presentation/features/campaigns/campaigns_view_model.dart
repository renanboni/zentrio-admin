
import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/domain/models/campaign.dart';
import 'package:zentrio_admin/domain/models/paginated_response.dart';
import 'package:zentrio_admin/domain/usecase/campaign_use_case.dart';

@Injectable()
class CampaignsViewModel  {
  final PromotionUseCase _promotionUseCase;

  final Signal<PaginatedResponse<Campaign>> campaigns = Signal(PaginatedResponse.empty());

  CampaignsViewModel(this._promotionUseCase) {
    _getCampaigns();
  }

  _getCampaigns() async {
    try {
      final response = await _promotionUseCase.getCampaigns();
      campaigns.value = response;
    } catch (e) {
      print(e);
    }
  }

  void refresh() {
    _getCampaigns();
  }
}