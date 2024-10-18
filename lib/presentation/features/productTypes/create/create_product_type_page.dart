import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/di/init.dart';
import 'package:zentrio_admin/presentation/components/dialog_footer.dart';
import 'package:zentrio_admin/presentation/components/dialog_header.dart';
import 'package:zentrio_admin/utils/extensions/context_ext.dart';

import 'create_product_type_view_model.dart';

class CreateProductTypePage extends StatefulWidget {
  const CreateProductTypePage({super.key});

  @override
  State<CreateProductTypePage> createState() => _CreateProductTypePageState();
}

class _CreateProductTypePageState extends State<CreateProductTypePage> {

  final formKey = GlobalKey<ShadFormState>();
  final CreateProductTypeViewModel viewModel = getIt<CreateProductTypeViewModel>();

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Column(
      children: [
        DialogHeader(onTap: () => GoRouter.of(context).pop()),
        Expanded(
          child: MaxWidthBox(
            maxWidth: context.maxWidth,
            child: ShadForm(
              key: formKey,
              child: ResponsiveRowColumn(
                layout: ResponsiveRowColumnType.COLUMN,
                columnCrossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ResponsiveRowColumnItem(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 36),
                        Text(
                          "Create Product Type",
                          style: theme.textTheme.h4,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          "Create a new product type to categorize your products.",
                          style: theme.textTheme.muted,
                        ),
                      ],
                    ),
                  ),
                  const ResponsiveRowColumnItem(
                    child: SizedBox(height: 24),
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
                          child:
                          ShadInputFormField(
                            label: const Text("Value"),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                            ]),
                            onChanged: viewModel.value.set,
                          ),
                        ),
                        const ResponsiveRowColumnItem(
                          rowFlex: 1,
                          child: SizedBox.shrink(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        DialogFooter(
          onCancel: () => GoRouter.of(context).pop(),
          onCreate: () {
            if (formKey.currentState?.validate() == true) {

            }
          },
        )
      ],
    );
  }
}
