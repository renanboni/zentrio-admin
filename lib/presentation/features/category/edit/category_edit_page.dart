import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/presentation/components/sheet_header.dart';
import 'package:zentrio_admin/presentation/features/category/edit/category_edit_view_model.dart';

import '../../categories/create/create_category_form.dart';

class CategoryEditPage extends StatefulWidget {
  final CategoryEditViewModel viewModel;

  final String categoryId;

  const CategoryEditPage({
    super.key,
    required this.categoryId,
    required this.viewModel,
  });

  @override
  State<CategoryEditPage> createState() => _CategoryEditPageState();
}

class _CategoryEditPageState extends State<CategoryEditPage> {

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
  void initState() {
    widget.viewModel.getCategory(widget.categoryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SheetHeader(
          title: "Edit Category",
          onTap: () => GoRouter.of(context).pop(),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CreateCategoryForm(
            initialTitle: widget.viewModel.title.watch(context),
            initialHandle: handle.text,
            initialDescription: description.text,
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
