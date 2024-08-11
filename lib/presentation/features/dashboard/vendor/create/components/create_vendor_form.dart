import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:signals/signals.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/main.dart';
import 'package:zentrio_admin/presentation/components/stepper/horizontal_stepper.dart';
import 'package:zentrio_admin/presentation/components/stepper/step_item_list.dart';
import 'package:zentrio_admin/presentation/features/dashboard/vendor/create/components/vendor_form.dart';

class CreateVendorForm extends StatefulWidget {
  const CreateVendorForm({super.key});

  @override
  State<CreateVendorForm> createState() => _CreateVendorFormState();
}

class _CreateVendorFormState extends State<CreateVendorForm> {

  final Signal _currentIndex = signal(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: HorizontalStepper(
            showEsc: true,
            currentStep: _currentIndex.watch(context),
            onStepTapped: (index) => _currentIndex.value = index,
            steps: [
              const StepItemList(
                title: 'Vendor',
                content: MaxWidthBox(
                  maxWidth: 500,
                  child: VendorForm(),
                ),
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
