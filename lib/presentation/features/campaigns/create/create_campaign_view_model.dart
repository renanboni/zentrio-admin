import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';

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
  final Signal<String> budgetLimit = signal("");
  final Signal<String> usageLimit = signal("");

  void onBudgetTypeChanged(CampaignBudgetType type) {
    budgetType.value = type;
  }
}
