import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/presentation/components/sheet_footer.dart';
import 'package:zentrio_admin/presentation/components/sheet_header.dart';
import 'package:zentrio_admin/presentation/features/category/edit/category_edit_view_model.dart';
import 'package:zentrio_admin/utils/extensions/context_ext.dart';

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
  @override
  void initState() {
    widget.viewModel.getCategory(widget.categoryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SheetHeader(
            title: "Edit Category",
            onTap: () => GoRouter.of(context).pop(),
          ),
          if (widget.viewModel.loading.watch(context))
            const LinearProgressIndicator()
          else
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CreateCategoryForm(
                title: widget.viewModel.category.watch(context).name,
                handle: widget.viewModel.category.watch(context).handle,
                description:
                    widget.viewModel.category.watch(context).description,
                initialStatus: widget.viewModel.categoryStatus.watch(context),
                initialVisibility:
                    widget.viewModel.categoryVisibility.watch(context),
                onTitleChanged: widget.viewModel.name.set,
                onHandleChanged: widget.viewModel.handle.set,
                onDescriptionChanged: widget.viewModel.description.set,
                onStatusChanged: widget.viewModel.onCategoryStatusChanged,
                onVisibilityChanged:
                    widget.viewModel.onCategoryVisibilityChanged,
              ),
            ),
          const Spacer(),
          SheetFooter(
            onSave: () {
              widget.viewModel.onSaved(() {
                context.success("Category updated successfully");
                GoRouter.of(context).pop(true);
              }, () => context.error("Failed to update category"));
            },
            onCancel: () {
              GoRouter.of(context).pop(false);
            },
          )
        ],
      ),
    );
  }
}
