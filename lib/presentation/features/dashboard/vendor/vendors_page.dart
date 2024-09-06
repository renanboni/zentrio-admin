import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/presentation/features/dashboard/vendor/vendors_controller.dart';

import 'components/invite_vendor_dialog_button.dart';
import 'components/vendors_table.dart';

class VendorsPage extends StatelessWidget {
  final VendorsController controller;

  const VendorsPage({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      padding: const EdgeInsets.all(0),
      title: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Vendors",
              style: ShadTheme.of(context).textTheme.table,
            ),
            const InviteVendorDialogButton()
          ],
        ),
      ),
      child: Expanded(
        child: Column(
          children: [
            const Divider(height: 1),
            Expanded(
              child: Watch(
                (context) => VendorsTable(
                  vendors: controller.vendors.watch(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
