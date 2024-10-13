import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/domain/models/customer.dart';

import '../../../components/edit_context_menu.dart';

final headings = [
  'Email',
  'Name',
  'Account',
  'Created',
  '',
];

class CustomersTable extends StatelessWidget {
  final List<Customer> customers;
  final Function(Customer) onClick;
  final Function(Customer) onEdit;

  const CustomersTable({
    super.key,
    required this.customers,
    required this.onClick,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ShadTable(
      onRowTap: (index) => onClick(customers[index - 1]),
      builder: (context, index) {
        final customer = customers[index.row];

        switch (index.column) {
          case 0:
            return ShadTableCell(
              child: Text(
                customer.email,
                style: theme.textTheme.muted,
              ),
            );
          case 1:
            return ShadTableCell(
              child: Text(
                "${customer.firstName} ${customer.lastName}",
                style: theme.textTheme.muted,
              ),
            );
          case 2:
            return ShadTableCell(
              child: Text(
                customer.hasAccount ? 'Yes' : 'No',
                style: theme.textTheme.muted,
              ),
            );
          case 3:
            return ShadTableCell(
              child: Text(
                customer.createdAt,
                style: theme.textTheme.muted,
              ),
            );
          case 4:
            return ShadTableCell(
              alignment: Alignment.centerRight,
              child: EditContextMenu(
                onEdit: () => onEdit(customer),
              ),
            );
          default:
            return const ShadTableCell(child: SizedBox());
        }
      },
      columnCount: headings.length,
      rowCount: customers.length,
      header: (context, column) {
        final isLast = column == headings.length - 1;
        return ShadTableCell.header(
          alignment: isLast ? Alignment.centerRight : null,
          child: Text(headings[column]),
        );
      },
      columnSpanExtent: (index) {
        if (index == 0) return const FixedTableSpanExtent(250);
        if (index == 1) return const FixedTableSpanExtent(250);
        if (index == 2) return const FixedTableSpanExtent(250);
        if (index == 3) return const FixedTableSpanExtent(250);
        if (index == 4) {
          return const MaxTableSpanExtent(
            FixedTableSpanExtent(120),
            RemainingTableSpanExtent(),
          );
        }
        return null;
      },
    );
  }
}
