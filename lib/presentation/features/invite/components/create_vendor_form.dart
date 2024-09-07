import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:zentrio_admin/presentation/components/stepper/horizontal_stepper.dart';
import 'package:zentrio_admin/presentation/components/stepper/step_item_list.dart';
import 'package:zentrio_admin/presentation/features/invite/components/store_form.dart';
import 'package:zentrio_admin/presentation/features/invite/components/vendor_form.dart';

class CreateVendorForm extends StatefulWidget {
  const CreateVendorForm({super.key});

  @override
  State<CreateVendorForm> createState() => _CreateVendorFormState();
}

class _CreateVendorFormState extends State<CreateVendorForm> {
  @override
  Widget build(BuildContext context) {
    return HorizontalStepper(
      showEsc: true,
      steps: [
        StepItemList(
          title: 'Vendor',
          state: HorizontalStepState.editing,
          content: MaxWidthBox(
            maxWidth: 500,
            child: VendorForm(
              firstNameController: TextEditingController(),
              lastNameController: TextEditingController(),
              emailController: TextEditingController(),
            ),
          ),
        ),
        const StepItemList(
          state: HorizontalStepState.disabled,
          title: 'Store',
          content: MaxWidthBox(
            maxWidth: 500,
            child: StoreForm(),
          ),
        ),
      ],
      onContinue: () {},
      onEsc: () {
        GoRouter.of(context).pop();
      },
    );
  }
}
