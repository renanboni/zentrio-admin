import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../domain/models/category_status.dart';
import '../../../../domain/models/category_visibility.dart';

class CreateCategoryForm extends StatelessWidget {
  final TextEditingController title;
  final TextEditingController handle;
  final TextEditingController description;
  final CategoryStatus? initialStatus;
  final CategoryVisibility? initialVisibility;

  final ValueChanged<String>? onTitleChanged;
  final ValueChanged<String>? onHandleChanged;
  final ValueChanged<String>? onDescriptionChanged;
  final ValueChanged<CategoryStatus?>? onStatusChanged;
  final ValueChanged<CategoryVisibility?>? onVisibilityChanged;

  const CreateCategoryForm({
    super.key,
    required this.title,
    required this.handle,
    required this.description,
    this.initialStatus,
    this.initialVisibility,
    this.onTitleChanged,
    this.onHandleChanged,
    this.onDescriptionChanged,
    this.onStatusChanged,
    this.onVisibilityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveRowColumn(
      layout: ResponsiveRowColumnType.COLUMN,
      columnSpacing: 16,
      children: [
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
                  controller: title,
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
                  controller: handle,
                  onChanged: onHandleChanged,
                ),
              ),
            ],
          ),
        ),
        ResponsiveRowColumnItem(
          child: ShadInputFormField(
            label: const Text('Description'),
            controller: description,
            onChanged: onDescriptionChanged,
            maxLines: 5,
          ),
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
                child: ShadSelectFormField<CategoryStatus>(
                  id: 'active',
                  minWidth: double.infinity,
                  label: const Text('Status'),
                  initialValue: initialStatus ?? CategoryStatus.active,
                  onChanged: onStatusChanged,
                  options: CategoryStatus.values
                      .map(
                        (status) => ShadOption(
                      value: status,
                      child: Text(status.name),
                    ),
                  )
                      .toList(),
                  selectedOptionBuilder: (context, value) => Text(value.name),
                ),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: ShadSelectFormField<CategoryVisibility>(
                  id: 'visibility',
                  minWidth: double.infinity,
                  label: const Text('Visibility'),
                  initialValue: initialVisibility ?? CategoryVisibility.public,
                  onChanged: onVisibilityChanged,
                  options: CategoryVisibility.values
                      .map(
                        (visibility) => ShadOption(
                      value: visibility,
                      child: SizedBox(width: 250, child: Text(visibility.name)),
                    ),
                  )
                      .toList(),
                  selectedOptionBuilder: (context, value) => Text(value.name),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}