import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/domain/models/vendor.dart';

final headings = [
  '',
  'Name',
  'Handle',
  ''
];

class VendorsTable extends StatelessWidget {
  final List<Vendor> vendors;

  const VendorsTable({
    super.key,
    required this.vendors,
  });

  @override
  Widget build(BuildContext context) {
    return ShadTable(
      builder: (context, index) {
        final vendor = vendors[index.row];

        switch (index.column) {
          case 0:
            return _buildLogo(vendor.logo);
          case 1:
            return ShadTableCell(child: Text(vendor.name));
          case 2:
            return ShadTableCell(child: Text(vendor.handle));
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
      child: SizedBox(
        width: 40,
        height: 40,
        child: Placeholder(),
      ),
    );
  }
}
