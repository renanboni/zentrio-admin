import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/domain/models/category_status.dart';
import 'package:zentrio_admin/domain/models/category_visibility.dart';
import 'package:zentrio_admin/main.dart';
import 'package:zentrio_admin/presentation/features/categories/create/create_category_form.dart';

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
          child: CreateCategoryForm(
            title: title,
            handle: handle,
            description: description,
            initialStatus: widget.viewModel.categoryStatus.watch(context),
            initialVisibility: widget.viewModel.categoryVisibility.watch(context),
            onTitleChanged: widget.viewModel.title.set,
            onHandleChanged: widget.viewModel.handle.set,
            onDescriptionChanged: widget.viewModel.description.set,
            onStatusChanged: widget.viewModel.onCategoryStatusChanged,
            onVisibilityChanged: widget.viewModel.onCategoryVisibilityChanged,
          ),
        ),
      ],
    );
  }
}
