import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/presentation/components/stepper/horizontal_stepper.dart';
import 'package:zentrio_admin/presentation/components/stepper/step_item_list.dart';
import 'package:zentrio_admin/presentation/features/dashboard/vendor/create/components/vendor_form.dart';

class CreateVendorForm extends StatefulWidget {
  const CreateVendorForm({super.key});

  @override
  State<CreateVendorForm> createState() => _CreateVendorFormState();
}

class _CreateVendorFormState extends State<CreateVendorForm> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: HorizontalStepper(
            showEsc: true,
            steps: [
              StepItemList(
                title: 'Vendor',
                formKey: GlobalKey<ShadFormState>(),
                state: HorizontalStepState.editing,
                content: const MaxWidthBox(
                  maxWidth: 500,
                  child: VendorForm(),
                ),
              ),
              StepItemList(
                state: HorizontalStepState.disabled,
                title: 'Store',
                content: Container(),
              ),
            ],
            onContinue: () {

            },
          ),
        ),
      ],
    );
  }
}
