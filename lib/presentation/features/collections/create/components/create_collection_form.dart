import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CreateCollectionForm extends StatelessWidget {
  final String title;
  final String handle;
  final ValueChanged<String>? onTitleChanged;
  final ValueChanged<String>? onHandleChanged;

  const CreateCollectionForm({
    super.key,
    required this.title,
    required this.handle,
    this.onTitleChanged,
    this.onHandleChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ResponsiveRowColumn(
      layout: ResponsiveRowColumnType.COLUMN,
      rowSpacing: 4,
      columnSpacing: 16,
      columnCrossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ResponsiveRowColumnItem(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create Collection",
                style: theme.textTheme.h4,
              ),
              const SizedBox(height: 2),
              Text(
                "Create a new collection to organize your products.",
                style: theme.textTheme.muted,
              ),
            ],
          ),
        ),
        const ResponsiveRowColumnItem(
          child: SizedBox(height: 16),
        ),
        ResponsiveRowColumnItem(
          child: ResponsiveRowColumn(
            layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                ? ResponsiveRowColumnType.COLUMN
                : ResponsiveRowColumnType.ROW,
            rowSpacing: 8,
            columnSpacing: 8,
            children: [
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: ShadInputFormField(
                  label: const Text('Title'),
                  initialValue: title,
                  onChanged: onTitleChanged,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                ),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: ShadInputFormField(
                  label: const Text('Handle'),
                  initialValue: handle,
                  onChanged: onHandleChanged,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
