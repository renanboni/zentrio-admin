import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/presentation/features/dashboard/vendors/vendors_view_model.dart';

import '../../../../di/init.dart';
import 'components/invite_vendor_dialog_button.dart';
import 'components/vendors_table.dart';

class VendorsPage extends StatefulWidget {

  const VendorsPage({
    super.key,
  });

  @override
  State<VendorsPage> createState() => _VendorsPageState();
}

class _VendorsPageState extends State<VendorsPage> {
  final VendorsViewModel viewModel = getIt<VendorsViewModel>();

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
                  vendors: viewModel.vendors.watch(context),
                  onClick: (vendor) {
                    GoRouter.of(context).go('/vendors/${vendor.id}');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
