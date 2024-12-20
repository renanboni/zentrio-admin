import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/domain/models/paginated_response.dart';
import 'package:zentrio_admin/domain/models/sales_channel.dart';
import 'package:zentrio_admin/domain/usecase/sales_channel_usecase.dart';

@Injectable()
class SalesChannelsViewModel {
  Signal<PaginatedResponse<SalesChannel>> salesChannels =
      Signal<PaginatedResponse<SalesChannel>>(
    PaginatedResponse.empty(),
  );

  final SalesChannelUseCase _salesChannelUseCase;

  SalesChannelsViewModel(this._salesChannelUseCase) {
    _getSalesChannels();
  }

  _getSalesChannels() async {
    try {
      salesChannels.value = await _salesChannelUseCase.getAll();
    } catch (e) {
      print(e);
    }
  }

  void refresh() {
    _getSalesChannels();
  }

  void onDeleteSalesChannel(
    String id,
    VoidCallback onSuccess,
    VoidCallback onError,
  ) async {
    try {
      await _salesChannelUseCase.deleteSalesChannel(id);
      _getSalesChannels();
      onSuccess();
    } catch (e) {
      onError();
      print(e);
    }
  }
}
