import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/di/init.dart';
import 'package:zentrio_admin/presentation/components/dialog_footer.dart';
import 'package:zentrio_admin/presentation/components/dialog_header.dart';
import 'package:zentrio_admin/presentation/features/salesChannels/create/create_sales_channel_view_model.dart';
import 'package:zentrio_admin/utils/extensions/context_ext.dart';
import 'package:zentrio_admin/utils/extensions/localization_ext.dart';

import '../../../components/switch_card.dart';

class CreateSalesChannelPage extends StatefulWidget {
  const CreateSalesChannelPage({super.key});

  @override
  State<CreateSalesChannelPage> createState() => _CreateSalesChannelPageState();
}

class _CreateSalesChannelPageState extends State<CreateSalesChannelPage> {
  final CreateSalesChannelViewModel _viewModel =
      getIt<CreateSalesChannelViewModel>();

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Column(
      children: [
        DialogHeader(onTap: () => GoRouter.of(context).pop()),
        Expanded(
          child: MaxWidthBox(
            maxWidth: context.maxWidth,
            child: ResponsiveRowColumn(
              layout: ResponsiveRowColumnType.COLUMN,
              rowSpacing: 16,
              columnSpacing: 16,
              children: [
                ResponsiveRowColumnItem(
                  child: ResponsiveRowColumn(
                    layout:
                        ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                            ? ResponsiveRowColumnType.COLUMN
                            : ResponsiveRowColumnType.ROW,
                    rowSpacing: 4,
                    columnSpacing: 8,
                    children: [
                      ResponsiveRowColumnItem(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 32),
                            Text(
                              context.loc.createSalesChannel,
                              style: theme.textTheme.h4,
                            ),
                            const SizedBox(height: 2),
                            Text(
                              context.loc.createSalesChannelDescription,
                              style: theme.textTheme.muted,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                ResponsiveRowColumnItem(
                  child: ResponsiveRowColumn(
                    layout:
                        ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                            ? ResponsiveRowColumnType.COLUMN
                            : ResponsiveRowColumnType.ROW,
                    rowSpacing: 8,
                    columnSpacing: 8,
                    children: [
                      ResponsiveRowColumnItem(
                        rowFlex: 1,
                        child: ShadInputFormField(
                          label: Text(context.loc.name),
                          onChanged: _viewModel.name.set,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
                        ),
                      ),
                      const ResponsiveRowColumnItem(
                        rowFlex: 1,
                        child: SizedBox.shrink(),
                      ),
                    ],
                  ),
                ),
                ResponsiveRowColumnItem(
                  child: ResponsiveRowColumnItem(
                    child: ShadInputFormField(
                      onChanged: _viewModel.description.set,
                      label: Text(context.loc.description),
                      maxLines: 3,
                    ),
                  ),
                ),
                ResponsiveRowColumnItem(
                  child: ResponsiveRowColumnItem(
                    child: SwitchCard(
                      title: context.loc.enabled,
                      description: context.loc.salesChannelEnabledDescription,
                      value: _viewModel.enabled.watch(context),
                      onChanged: _viewModel.enabled.set,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        DialogFooter(
          onCancel: () => GoRouter.of(context).pop(),
          onCreate: () {
            _viewModel.onCreateSalesChannel(
              () {
                context.success("Sales channel created successfully");
                GoRouter.of(context).pop(true);
              },
              () => context.error("Failed to create sales channel"),
            );
          },
        )
      ],
    );
  }
}


