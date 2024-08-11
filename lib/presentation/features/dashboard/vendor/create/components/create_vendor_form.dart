import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/presentation/components/stepper/horizontal_stepper.dart';
import 'package:zentrio_admin/presentation/components/stepper/step_item_list.dart';
import 'package:zentrio_admin/presentation/features/dashboard/vendor/create/components/vendor_form.dart';

class CreateVendorForm extends StatelessWidget {
  const CreateVendorForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: HorizontalStepper(
            showEsc: true,
            steps: [
              const StepItemList(
                title: 'Vendor',
                content: MaxWidthBox(maxWidth: 500, child: VendorForm()),
              ),
              StepItemList(
                title: 'Store',
                content: Container(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
