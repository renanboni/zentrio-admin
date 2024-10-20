import 'package:flutter/material.dart';
import 'package:zentrio_admin/domain/models/sales_channel.dart';

class SalesChannelsDataSource extends DataTableSource {
  late List<SalesChannel> salesChannels;

  SalesChannelsDataSource({required this.salesChannels});

  @override
  DataRow? getRow(int index) {
    final salesChannel = salesChannels[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(salesChannel.name)),
        DataCell(Text(salesChannel.description)),
        DataCell(Text(salesChannel.isDisabled ? "Disabled" : "Active")),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => salesChannels.length;

  @override
  int get selectedRowCount => 0;
}
