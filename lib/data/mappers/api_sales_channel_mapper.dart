import '../../domain/models/sales_channel.dart';
import '../models/api_sales_channel.dart';

extension ApiSalesChannelMapper on ApiSalesChannel {
  SalesChannel toSalesChannel() {
    return SalesChannel(
      id: id ?? '',
      name: name ?? '',
      description: description ?? '',
      isDisabled: isDisabled ?? false,
      metadata: metadata ?? {},
    );
  }
}
