
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class VendorForm extends StatelessWidget {
  const VendorForm({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveRowColumn(
      layout: ResponsiveRowColumnType.COLUMN,
      // We'll manage rows manually
      rowSpacing: 4,
      columnSpacing: 8,
      // Add some spacing between rows
      children: [
        // First Row: First Name and Last Name
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
                ),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: ShadInputFormField(
                  label: const Text('Last name'),
                  placeholder: const Text("Enter last name"),
                ),
              ),
            ],
          ),
        ),
        // Second Row: Email
        ResponsiveRowColumnItem(
          child: ShadInputFormField(
            label: const Text('Email'),
            placeholder: const Text("Enter email"),
          ),
        ),
      ],
    );
  }
}
