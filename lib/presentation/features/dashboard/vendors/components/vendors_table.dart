import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/domain/models/vendor.dart';

import 'edit_vendor_context_menu.dart';

final headings = [
  '',
  'Name',
  'Handle',
  ''
];

class VendorsTable extends StatelessWidget {
  final List<Vendor> vendors;
  final ValueChanged<Vendor> onClick;

  const VendorsTable({
    super.key,
    required this.vendors,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return ShadTable(
      onRowTap: (index) => onClick(vendors[index - 1]),
      builder: (context, index) {
        final vendor = vendors[index.row];

        switch (index.column) {
          case 0:
            return _buildLogo(vendor.logo);
          case 1:
            return ShadTableCell(child: Text(vendor.name));
          case 2:
            return ShadTableCell(child: Text(vendor.handle));
          case 3:
            return const ShadTableCell(
              alignment: Alignment.centerRight,
              child: EditVendorContextMenu(),
            );
          default:
            return const ShadTableCell(child: SizedBox());
        }
      },
      columnCount: 4,
      rowCount: vendors.length,
      header: (context, column) {
        final isLast = column == headings.length - 1;
        return ShadTableCell.header(
          alignment: isLast ? Alignment.centerRight : null,
          child: Text(headings[column]),
        );
      },
      columnSpanExtent: (index) {
        if (index == 0) return const FixedTableSpanExtent(150);
        if (index == 1) return const FixedTableSpanExtent(200);
        if (index == 2) return const FixedTableSpanExtent(250);
        if (index == 3) {
          return const MaxTableSpanExtent(
            FixedTableSpanExtent(120),
            RemainingTableSpanExtent(),
          );
        }
        return null;
      },
    );
  }

  _buildLogo(String logo) {
    return const ShadTableCell(
      alignment: Alignment.center,
      child: ShadAvatar(
        'https://app.requestly.io/delay/2000/avatars.githubusercontent.com/u/124599?v=4',
        placeholder: Text('CN'),
      ),
    );
  }
}
