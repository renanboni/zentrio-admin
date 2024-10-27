import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/data/models/req/create_budget_req.dart';
import 'package:zentrio_admin/data/models/req/create_campaign_req.dart';
import 'package:zentrio_admin/domain/models/media_file.dart';
import 'package:zentrio_admin/domain/usecase/campaign_use_case.dart';
import 'package:zentrio_admin/utils/constants.dart';
import 'package:zentrio_admin/utils/extensions/string_ext.dart';

enum CampaignBudgetType { usage, spend }

@Injectable()
class CreateCampaignViewModel {
  final Signal<String> name = signal("");
  final Signal<String> handle = signal("");
  final Signal<String> description = signal("");
  final Signal<DateTime?> startDate = signal(null);
  final Signal<DateTime?> endDate = signal(null);
  final Signal<CampaignBudgetType> budgetType =
      signal(CampaignBudgetType.usage);
  final Signal<num?> budgetLimit = signal(null);
  final Signal<String> usageLimit = signal("");

  final PromotionUseCase _promotionUseCase;

  CreateCampaignViewModel(this._promotionUseCase);

  void onBudgetTypeChanged(CampaignBudgetType type) {
    budgetType.value = type;
  }

  void createCampaign(
    VoidCallback onSuccess,
    VoidCallback onError,
  ) async {
    try {
      await _promotionUseCase.createCampaign(
        CreateCampaignReq(
          name: name.value,
          description: description.value,
          campaignIdentifier: handle.value,
          budget: CreateBudgetReq(
            type: budgetType.value == CampaignBudgetType.usage
                ? "usage"
                : "spend",
            limit: budgetType.value == CampaignBudgetType.usage
                ? int.tryParse(usageLimit.value)
                : ((budgetLimit.value ?? 0) * 100).toInt(),
            currencyCode: budgetType.value == CampaignBudgetType.spend
                ? kCurrencyCode
                : null,
          ),
          startsAt: startDate.value?.toIso8601String(),
          endsAt: endDate.value?.toIso8601String(),
        ),
      );
      onSuccess();
    } catch (e) {
      onError();
      print(e);
    }
  }
}
