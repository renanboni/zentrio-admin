import 'package:injectable/injectable.dart';
import 'package:zentrio_admin/domain/models/paginated_response.dart';
import 'package:zentrio_admin/domain/models/sales_channel.dart';
import 'package:zentrio_admin/domain/repositories/sales_channel_repository.dart';

@injectable
class SalesChannelUseCase {
  final SalesChannelRepository _salesChannelRepository;

  SalesChannelUseCase(this._salesChannelRepository);

  Future<PaginatedResponse<SalesChannel>> getAll(
      {int limit = 10, int offset = 0})  {
    return _salesChannelRepository.getAll(limit: limit, offset: offset);
  }
}
