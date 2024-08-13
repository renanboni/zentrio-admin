import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class VendorForm extends StatefulWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;

  const VendorForm({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
  });

  @override
  State<VendorForm> createState() => _VendorFormState();
}

class _VendorFormState extends State<VendorForm> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveRowColumn(
      layout: ResponsiveRowColumnType.COLUMN,
      rowSpacing: 4,
      columnSpacing: 8,
      children: [
        ResponsiveRowColumnItem(
          child: ResponsiveRowColumn(
            layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                ? ResponsiveRowColumnType.COLUMN
                : ResponsiveRowColumnType.ROW,
            rowSpacing: 4,
            columnSpacing: 8,
            children: [
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: ShadInputFormField(
                  label: const Text('First name'),
                  placeholder: const Text("Enter first name"),
                  controller: widget.firstNameController,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.firstName(),
                  ]),
                ),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: ShadInputFormField(
                  label: const Text('Last name'),
                  controller: widget.lastNameController,
                  placeholder: const Text("Enter last name"),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.lastName(),
                  ]),
                ),
              ),
            ],
          ),
        ),
        // Second Row: Email
        ResponsiveRowColumnItem(
          child: ShadInputFormField(
            label: const Text('Email'),
            controller: widget.emailController,
            placeholder: const Text("Enter email"),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.email(),
            ]),
          ),
        ),
      ],
    );
  }
}
