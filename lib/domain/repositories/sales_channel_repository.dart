import 'package:zentrio_admin/data/models/req/create_sales_channel_req.dart';
import 'package:zentrio_admin/domain/models/paginated_response.dart';

import '../models/sales_channel.dart';

abstract class SalesChannelRepository {
  Future<PaginatedResponse<SalesChannel>> getAll(
      {int limit = 10, int offset = 0});

  Future<void> createSalesChannel(CreateSalesChannelReq req);

  Future<void> deleteSalesChannel(String id);
}
