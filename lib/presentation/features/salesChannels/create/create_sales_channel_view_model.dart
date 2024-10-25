import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/data/models/req/create_sales_channel_req.dart';
import 'package:zentrio_admin/domain/usecase/sales_channel_usecase.dart';

@Injectable()
class CreateSalesChannelViewModel {
  final Signal<String> name = signal("");
  final Signal<String> description = signal("");
  final Signal<bool> enabled = signal(false);

  final SalesChannelUseCase _salesChannelUseCase;

  CreateSalesChannelViewModel(this._salesChannelUseCase);

  void onCreateSalesChannel(
    VoidCallback onSuccess,
    VoidCallback onError,
  ) async {
    try {
      await _salesChannelUseCase.createSalesChannel(
        CreateSalesChannelReq(
            name: name.value,
            description: description.value,
            isDisabled: enabled.value == false),
      );
      onSuccess();
    } catch (e) {
      onError();
      print(e);
    }
  }
}
