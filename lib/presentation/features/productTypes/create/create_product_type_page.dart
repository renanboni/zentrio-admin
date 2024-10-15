import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/presentation/components/dialog_footer.dart';
import 'package:zentrio_admin/presentation/components/dialog_header.dart';
import 'package:zentrio_admin/utils/extensions/context_ext.dart';

class CreateProductTypePage extends StatelessWidget {
  const CreateProductTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Column(
      children: [
        DialogHeader(onTap: () => GoRouter.of(context).pop()),
        Expanded(
          child: MaxWidthBox(
            maxWidth: context.maxWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                Text(
                  "Create Product Type",
                  style: theme.textTheme.h4,
                ),
                const SizedBox(height: 2),
                Text(
                  "Create a new product type to categorize your products.",
                  style: theme.textTheme.muted,
                ),
                const SizedBox(height: 36),
                ShadInputFormField(
                  label: const Text("Value"),
                )
              ],
            ),
          ),
        ),
        DialogFooter(
          onCancel: () => GoRouter.of(context).pop(),
          onCreate: () {},
        )
      ],
    );
  }
}
