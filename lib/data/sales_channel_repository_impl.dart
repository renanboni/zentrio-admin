import 'package:zentrio_admin/data/mappers/api_sales_channel_mapper.dart';
import 'package:zentrio_admin/data/models/req/create_sales_channel_req.dart';
import 'package:zentrio_admin/data/remote/sales_channel_service.dart';
import 'package:zentrio_admin/domain/models/paginated_response.dart';
import 'package:zentrio_admin/domain/models/sales_channel.dart';
import 'package:zentrio_admin/domain/repositories/sales_channel_repository.dart';

class SalesChannelRepositoryImpl extends SalesChannelRepository {
  final SalesChannelService _service;

  SalesChannelRepositoryImpl(this._service);

  @override
  Future<PaginatedResponse<SalesChannel>> getAll(
      {int limit = 10, int offset = 0}) {
    return _service.getAll(limit, offset).then(
      (response) {
        return PaginatedResponse<SalesChannel>(
          count: response.count ?? 0,
          offset: response.offset ?? 0,
          limit: response.limit ?? 0,
          data: response.data?.map((e) => e.toSalesChannel()).toList() ?? [],
        );
      },
    );
  }

  @override
  Future<void> createSalesChannel(CreateSalesChannelReq req) {
    return _service.createSalesChannel(req);
  }

  @override
  Future<void> deleteSalesChannel(String id) {
    return _service.deleteSalesChannel(id);
  }
}
