import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/di/init.dart';
import 'package:zentrio_admin/presentation/components/dialog_footer.dart';
import 'package:zentrio_admin/presentation/components/dialog_header.dart';
import 'package:zentrio_admin/presentation/features/collections/create/components/create_collection_form.dart';
import 'package:zentrio_admin/presentation/features/collections/create/create_collection_view_model.dart';
import 'package:zentrio_admin/utils/extensions/context_ext.dart';

class CreateCollectionPage extends StatefulWidget {
  const CreateCollectionPage({super.key});

  @override
  State<CreateCollectionPage> createState() => _CreateCollectionPageState();
}

class _CreateCollectionPageState extends State<CreateCollectionPage> {
  final CreateCollectionViewModel _viewModel =
      getIt<CreateCollectionViewModel>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DialogHeader(onTap: () => GoRouter.of(context).pop()),
        const SizedBox(height: 16),
        Expanded(
          child: MaxWidthBox(
            maxWidth: context.maxWidth,
            child: CreateCollectionForm(
              title: _viewModel.title.watch(context),
              handle: _viewModel.handle.watch(context),
              onTitleChanged: _viewModel.title.set,
              onHandleChanged: _viewModel.handle.set,
            ),
          ),
        ),
        DialogFooter(
          onCancel: () => GoRouter.of(context).pop(),
          onCreate: () {
            _viewModel.createCollection(
              () {
                context.success("Collection created successfully");
                GoRouter.of(context).pop(true);
              },
              () {
                context.error("Failed to create collection");
              },
            );
          },
        ),
      ],
    );
  }
}
