import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class StoreForm extends StatelessWidget {
  const StoreForm({super.key});

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
                  label: const Text('Name'),
                  placeholder: const Text("Enter store name"),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                ),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: ShadInputFormField(
                  label: const Text('Slug'),
                  placeholder: const Text("Enter store slug"),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
