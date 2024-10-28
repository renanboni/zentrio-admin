
import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/domain/models/promotion_type.dart';

@Injectable()
class CreatePromotionViewModel {

  final Signal<PromotionType> promotionType = signal<PromotionType>(PromotionType.amountOffProducts);
}