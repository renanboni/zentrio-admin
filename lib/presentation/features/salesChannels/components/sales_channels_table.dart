import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:zentrio_admin/domain/models/paginated_response.dart';
import 'package:zentrio_admin/domain/models/sales_channel.dart';

import '../../../components/data_table_view.dart';

class SalesChannelsTable extends StatelessWidget {
  final PaginatedResponse<SalesChannel> salesChannels;

  const SalesChannelsTable({
    super.key,
    required this.salesChannels,
  });

  @override
  Widget build(BuildContext context) {
    return DataTableView(
      columns: const ["Name", "Description", "Status"],
      data: salesChannels.data,
      cellBuilder: (salesChannel) => [
        DataCell(Text(salesChannel.name)),
        DataCell(Text(salesChannel.description)),
        DataCell(Text(salesChannel.isDisabled ? "Disabled" : "Active")),
      ],
    );
  }

  List<DataColumn2> get _columns {
    return [
      const DataColumn2(
        label: Text("Name"),
      ),
      const DataColumn2(
        label: Text("Description"),
      ),
      const DataColumn2(
        label: Text("Status"),
      ),
    ];
  }
}
