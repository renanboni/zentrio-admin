import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/domain/models/category_status.dart';
import 'package:zentrio_admin/domain/models/category_visibility.dart';

import 'create_category_view_model.dart';

class CategoryDetailsForm extends StatefulWidget {
  final CreateCategoryViewModel viewModel;

  const CategoryDetailsForm({
    super.key,
    required this.viewModel,
  });

  @override
  State<CategoryDetailsForm> createState() => _CategoryDetailsFormState();
}

class _CategoryDetailsFormState extends State<CategoryDetailsForm> {
  late TextEditingController title = TextEditingController(
    text: widget.viewModel.title.value,
  );

  late TextEditingController handle = TextEditingController(
    text: widget.viewModel.handle.value,
  );

  late TextEditingController description = TextEditingController(
    text: widget.viewModel.description.value,
  );

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
                "Create Category",
                style: theme.textTheme.h4,
              ),
              const SizedBox(height: 2),
              Text(
                "Create a new category to organize your products.",
                style: theme.textTheme.muted,
              ),
            ],
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
                child: ShadInputFormField(
                  label: const Text('Title'),
                  controller: title,
                  onChanged: widget.viewModel.title.set,
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
                  onChanged: widget.viewModel.handle.set,
                ),
              ),
            ],
          ),
        ),
        ResponsiveRowColumnItem(
          child: ShadInputFormField(
            label: const Text('Description'),
            controller: description,
            onChanged: widget.viewModel.description.set,
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
                  initialValue: CategoryStatus.active,
                  onChanged: (v) => widget.viewModel.onCategoryStatusChanged(v),
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
                  initialValue: CategoryVisibility.public,
                  onChanged: (v) =>
                      widget.viewModel.onCategoryVisibilityChanged(v),
                  options: CategoryVisibility.values
                      .map(
                        (status) => ShadOption(
                          value: status,
                          child: SizedBox(width: 250, child: Text(status.name)),
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
