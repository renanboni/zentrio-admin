import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/domain/models/promotion_type.dart';
import 'package:zentrio_admin/presentation/features/promotions/create/models/promotion_condition.dart';

import 'models/operator.dart';
import 'models/promotion_attribute.dart';

enum PromotionMethod { code, automatic }

@Injectable()
class CreatePromotionViewModel {
  final Signal<PromotionType> promotionType = signal<PromotionType>(
    PromotionType.amountOffProducts,
  );
  final Signal<PromotionMethod> promotionMethod = signal<PromotionMethod>(
    PromotionMethod.code,
  );
  final ListSignal<PromotionAttribute> promotionAttributes = listSignal(
    [
      const PromotionAttribute(type: PromotionAttributeType.product),
      const PromotionAttribute(type: PromotionAttributeType.collection),
      const PromotionAttribute(type: PromotionAttributeType.productType),
      const PromotionAttribute(type: PromotionAttributeType.productTag),
    ],
  );
  final ListSignal<PromotionCondition> conditions = listSignal([]);

  void onAttributeSelected(int index, PromotionAttribute attribute) {
    promotionAttributes.value = promotionAttributes.value
        .map((e) => e.type == attribute.type ? e.copyWith(selected: true) : e)
        .toList();
  }

  void onAddCondition() {
    conditions.add(
      PromotionCondition(
        operator: Operator.contains,
      ),
    );
  }

  void onClearAll() {
    conditions.clear();
    promotionAttributes.value = promotionAttributes.value
        .map((e) => e.copyWith(selected: false))
        .toList();
  }
}
