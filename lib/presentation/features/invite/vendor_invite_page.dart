import 'package:flutter/material.dart';

import 'components/create_vendor_form.dart';

class VendorInvitePage extends StatelessWidget {
  const VendorInvitePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      height: double.infinity,
        child: CreateVendorForm()
    );
  }
}
