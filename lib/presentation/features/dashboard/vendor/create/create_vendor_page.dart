import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:zentrio_admin/presentation/features/dashboard/vendor/create/components/create_vendor_form.dart';

class CreateVendorPage extends StatelessWidget {
  const CreateVendorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      height: double.infinity,
        child: CreateVendorForm()
    );
  }
}
