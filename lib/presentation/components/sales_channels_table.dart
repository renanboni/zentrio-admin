import 'package:flutter/material.dart';
import 'package:zentrio_admin/domain/models/sales_channel.dart';

import 'data_table_view.dart';
import 'edit_context_menu.dart';

class SalesChannelsTable extends StatelessWidget {
  final List<SalesChannel> salesChannels;
  final Function(SalesChannel)? onEdit;
  final Function(SalesChannel)? onDelete;

  const SalesChannelsTable({
    super.key,
    required this.salesChannels,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return DataTableView(
      columns: const ["Name", "Description", "Status", ""],
      data: salesChannels,
      cellBuilder: (salesChannel) => [
        DataCell(Text(salesChannel.name)),
        DataCell(Text(salesChannel.description)),
        DataCell(
          Text(salesChannel.isDisabled ? "Disabled" : "Active"),
        ),
        DataCell(
          Align(
            alignment: Alignment.centerRight,
            child: EditContextMenu(
              deleteDialogTitle: "Are you sure?",
              deleteDialogDescription:
                  "You are about to delete the Sales Channel ${salesChannel.name}. This action cannot be undone.",
              onEdit: () => {
                onEdit?.call(salesChannel)
              },
              onDelete: () => {
                onDelete?.call(salesChannel)
              },
            ),
          ),
        )
      ],
    );
  }
}
