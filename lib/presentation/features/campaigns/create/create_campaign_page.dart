import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/di/init.dart';
import 'package:zentrio_admin/main.dart';
import 'package:zentrio_admin/presentation/components/date_input.dart';
import 'package:zentrio_admin/presentation/components/dialog_footer.dart';
import 'package:zentrio_admin/presentation/components/optional_label.dart';
import 'package:zentrio_admin/presentation/components/title_heading.dart';
import 'package:zentrio_admin/presentation/features/campaigns/create/create_campaign_view_model.dart';
import 'package:zentrio_admin/utils/extensions/context_ext.dart';
import 'package:zentrio_admin/utils/extensions/localization_ext.dart';

import '../../../../utils/constants.dart';
import '../../../components/dialog_header.dart';
import '../../../components/radio_item_list.dart';

class CreateCampaignPage extends StatefulWidget {
  const CreateCampaignPage({super.key});

  @override
  State<CreateCampaignPage> createState() => _CreateCampaignPageState();
}

class _CreateCampaignPageState extends State<CreateCampaignPage> {
  final CreateCampaignViewModel viewModel = getIt<CreateCampaignViewModel>();
  final budgetLimitController = TextEditingController();
  final usageLimitController = TextEditingController();
  final formatter = CurrencyTextInputFormatter.currency(
    locale: kDefaultLocale,
    symbol: kCurrencySymbol,
  );

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Column(
      children: [
        DialogHeader(onTap: () => GoRouter.of(context).pop()),
        Expanded(
          child: SingleChildScrollView(
            child: MaxWidthBox(
              maxWidth: context.maxWidth,
              child: ResponsiveRowColumn(
                layout: ResponsiveRowColumnType.COLUMN,
                rowSpacing: 16,
                columnSpacing: 16,
                columnCrossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ResponsiveRowColumnItem(
                    child: SizedBox(height: 32),
                  ),
                  ResponsiveRowColumnItem(
                    child: TitleHeading(
                      title: context.loc.createCampaign,
                      description: context.loc.createCampaignDescription,
                    ),
                  ),
                  ResponsiveRowColumnItem(
                    child: ResponsiveRowColumn(
                      layout:
                          ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                              ? ResponsiveRowColumnType.COLUMN
                              : ResponsiveRowColumnType.ROW,
                      rowSpacing: 16,
                      columnSpacing: 16,
                      children: [
                        ResponsiveRowColumnItem(
                          rowFlex: 1,
                          child: ShadInputFormField(
                            label: Text(context.loc.name),
                            initialValue: "",
                            onChanged: viewModel.name.set,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                            ]),
                          ),
                        ),
                        ResponsiveRowColumnItem(
                          rowFlex: 1,
                          child: ShadInputFormField(
                            label: Text(context.loc.handle),
                            initialValue: "",
                            onChanged: viewModel.handle.set,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ResponsiveRowColumnItem(
                    child: ShadInputFormField(
                      label: Text(context.loc.description),
                      initialValue: "",
                      onChanged: viewModel.description.set,
                      maxLines: 5,
                    ),
                  ),
                  ResponsiveRowColumnItem(
                    child: ResponsiveRowColumn(
                      layout:
                          ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                              ? ResponsiveRowColumnType.COLUMN
                              : ResponsiveRowColumnType.ROW,
                      rowSpacing: 16,
                      columnSpacing: 16,
                      children: [
                        ResponsiveRowColumnItem(
                          rowFlex: 1,
                          child: Column(
                            children: [
                              OptionalLabel(label: context.loc.startDate),
                              const SizedBox(height: 8),
                              DateInput(
                                value: viewModel.startDate.watch(context),
                                onChanged: viewModel.startDate.set,
                              ),
                            ],
                          ),
                        ),
                        ResponsiveRowColumnItem(
                          rowFlex: 1,
                          child: Column(
                            children: [
                              OptionalLabel(label: context.loc.endDate),
                              const SizedBox(height: 8),
                              DateInput(
                                value: viewModel.endDate.watch(context),
                                onChanged: viewModel.endDate.set,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const ResponsiveRowColumnItem(
                    child: SizedBox(height: 16),
                  ),
                  ResponsiveRowColumnItem(
                    child: TitleHeading(
                      title: context.loc.campaignBudget,
                      description: context.loc.campaignBudgetDescription,
                    ),
                  ),
                  ResponsiveRowColumnItem(
                    child: ResponsiveRowColumn(
                      layout:
                          ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                              ? ResponsiveRowColumnType.COLUMN
                              : ResponsiveRowColumnType.ROW,
                      rowSpacing: 16,
                      columnSpacing: 16,
                      children: [
                        ResponsiveRowColumnItem(
                          rowFlex: 1,
                          child: RadioItemList(
                            title: context.loc.usage,
                            description: context.loc.usageDescription,
                            value: viewModel.budgetType.watch(context) ==
                                CampaignBudgetType.usage,
                            onTap: () {
                              viewModel.onBudgetTypeChanged(
                                  CampaignBudgetType.usage);
                              budgetLimitController.clear();
                            },
                          ),
                        ),
                        ResponsiveRowColumnItem(
                          rowFlex: 1,
                          child: RadioItemList(
                            title: context.loc.spend,
                            description: context.loc.spendDescription,
                            value: viewModel.budgetType.watch(context) ==
                                CampaignBudgetType.spend,
                            onTap: () {
                              viewModel.onBudgetTypeChanged(
                                  CampaignBudgetType.spend);
                              usageLimitController.clear();
                            },
                          ),
                        ),
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.loc.limit,
                                style: theme.textTheme.small,
                              ),
                              const SizedBox(height: 8),
                              if (viewModel.budgetType.watch(context) ==
                                  CampaignBudgetType.usage)
                                ShadInput(
                                  onChanged: viewModel.usageLimit.set,
                                  controller: usageLimitController,
                                  keyboardType: TextInputType.number,
                                )
                              else
                                ShadInput(
                                  onChanged: (val) {
                                    viewModel.budgetLimit.value =
                                        formatter.getUnformattedValue();
                                  },
                                  controller: budgetLimitController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [formatter],
                                ),
                            ],
                          ),
                        ),
                        const ResponsiveRowColumnItem(
                          rowFlex: 1,
                          child: SizedBox.shrink(),
                        ),
                      ],
                    ),
                  ),
                  const ResponsiveRowColumnItem(
                    child: SizedBox(height: 24),
                  ),
                ],
              ),
            ),
          ),
        ),
        DialogFooter(
          onCancel: () => GoRouter.of(context).pop(),
          onCreate: () {
            viewModel.createCampaign(
              () {
                context.success("Campaign created successfully");
                GoRouter.of(context).pop(true);
              },
              () => context.error("Failed to create campaign"),
            );
          },
        )
      ],
    );
  }
}
