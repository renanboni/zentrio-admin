import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'empty_list_placeholder.dart';

class DataTableView<T> extends StatelessWidget {
  final List<String> columns;
  final List<T> data;
  final List<DataCell> Function(T) cellBuilder;
  final List<Widget>? actions;
  final bool showCheckboxColumn;
  final Function(T)? onRowTap;

  const DataTableView({
    super.key,
    required this.columns,
    required this.data,
    required this.cellBuilder,
    this.actions,
    this.onRowTap,
    this.showCheckboxColumn = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return PaginatedDataTable2(
      columns:
          columns.map((column) => DataColumn2(label: Text(column))).toList(),
      source: _DataSource(data, cellBuilder, onRowTap: onRowTap),
      fit: FlexFit.tight,
      showCheckboxColumn: showCheckboxColumn,
      isVerticalScrollBarVisible: false,
      wrapInCard: false,
      headingTextStyle: theme.tableTheme.cellHeaderStyle,
      dataTextStyle: theme.tableTheme.cellStyle,
      actions: actions,
      empty: const EmptyListPlaceholder(),
    );
  }
}

class _DataSource<T> extends DataTableSource {
  final List<T> data;
  final List<DataCell> Function(T) cellBuilder;
  final Function(T)? onRowTap;

  _DataSource(this.data, this.cellBuilder, {this.onRowTap});

  @override
  DataRow? getRow(int index) {
    if (index >= data.length) {
      return null;
    }

    final T item = data[index];
    return DataRow.byIndex(
      index: index,
      cells: cellBuilder(item),
      onSelectChanged: onRowTap != null ? (_) => onRowTap!(item) : null,
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
