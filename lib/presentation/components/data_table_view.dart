import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'empty_list_placeholder.dart';

class DataTableView<T> extends StatelessWidget {
  final List<String> columns;
  final List<T> data;
  final List<DataCell> Function(T) cellBuilder;

  const DataTableView({
    super.key,
    required this.columns,
    required this.data,
    required this.cellBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return PaginatedDataTable2(
      columns: columns.map((column) => DataColumn2(label: Text(column))).toList(),
      source: _DataSource(data, cellBuilder),
      fit: FlexFit.tight,
      isVerticalScrollBarVisible: false,
      wrapInCard: false,
      headingTextStyle: theme.tableTheme.cellHeaderStyle,
      dataTextStyle: theme.tableTheme.cellStyle,
      empty: const EmptyListPlaceholder(),
    );
  }
}

class _DataSource<T> extends DataTableSource {

  final List<T> data;
  final List<DataCell> Function(T) cellBuilder;

  _DataSource(this.data, this.cellBuilder);

  @override
  DataRow? getRow(int index) {
    if (index >= data.length) {
      return null;
    }

    final T item = data[index];
    return DataRow.byIndex(
      index: index,
      cells: cellBuilder(item),
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
