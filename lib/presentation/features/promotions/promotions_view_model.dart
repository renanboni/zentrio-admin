
import 'package:injectable/injectable.dart';
import 'package:zentrio_admin/domain/usecase/campaign_use_case.dart';

@Injectable()
class PromotionsViewModel {

  final PromotionUseCase _promotionUseCase;

  PromotionsViewModel(this._promotionUseCase);
}