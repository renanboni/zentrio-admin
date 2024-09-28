import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:zentrio_admin/presentation/components/dialog_footer.dart';
import 'package:zentrio_admin/presentation/components/dialog_header.dart';
import 'package:zentrio_admin/presentation/features/collections/create/components/create_collection_form.dart';
import 'package:zentrio_admin/utils/extensions/context_ext.dart';

class CreateCollectionPage extends StatelessWidget {
  const CreateCollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DialogHeader(onTap: () => GoRouter.of(context).pop()),
        const SizedBox(height: 16),
        Expanded(
          child: MaxWidthBox(
            maxWidth: context.maxWidth,
            child: const CreateCollectionForm(
              title: '',
              handle: '',
            ),
          ),
        ),
        DialogFooter(
          onCancel: () => GoRouter.of(context).pop(),
          onCreate: () {},
        ),
      ],
    );
  }
}
