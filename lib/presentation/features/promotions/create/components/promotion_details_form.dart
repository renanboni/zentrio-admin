import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/presentation/components/radio_item_list.dart';
import 'package:zentrio_admin/presentation/components/title_heading.dart';
import 'package:zentrio_admin/presentation/features/promotions/create/create_promotion_view_model.dart';
import 'package:zentrio_admin/presentation/features/promotions/create/models/promotion_condition.dart';
import 'package:zentrio_admin/utils/extensions/localization_ext.dart';

import '../../../../components/condition_select.dart';
import '../models/promotion_attribute.dart';

class PromotionDetailsForm extends StatelessWidget {
  final PromotionMethod method;
  final List<PromotionAttribute> attributes;
  final List<PromotionCondition> conditions;
  final ValueChanged<PromotionMethod> onMethodChanged;
  final Function(int index, PromotionAttribute attribute) onAttributeSelected;
  final VoidCallback onAddCondition;
  final VoidCallback onClearAll;

  const PromotionDetailsForm({
    super.key,
    required this.method,
    required this.attributes,
    required this.conditions,
    required this.onMethodChanged,
    required this.onAddCondition,
    required this.onClearAll,
    required this.onAttributeSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return SingleChildScrollView(
      child: ResponsiveRowColumn(
        layout: ResponsiveRowColumnType.COLUMN,
        columnSpacing: 16,
        children: [
          const ResponsiveRowColumnItem(
            child: SizedBox(height: 32),
          ),
          ResponsiveRowColumnItem(
            child: TitleHeading(title: context.loc.promotionDetails),
          ),
          ResponsiveRowColumnItem(
            child: ResponsiveRowColumn(
              layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                  ? ResponsiveRowColumnType.COLUMN
                  : ResponsiveRowColumnType.ROW,
              rowSpacing: 16,
              columnSpacing: 16,
              columnMainAxisSize: MainAxisSize.min,
              children: [
                ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: RadioItemList(
                    title: context.loc.promotionCode,
                    description: context.loc.promotionCodeDescription,
                    value: method == PromotionMethod.code,
                    onTap: () => onMethodChanged(PromotionMethod.code),
                  ),
                ),
                ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: RadioItemList(
                    title: context.loc.automatic,
                    description: context.loc.automaticDescription,
                    value: method == PromotionMethod.automatic,
                    onTap: () => onMethodChanged(PromotionMethod.automatic),
                  ),
                ),
              ],
            ),
          ),
          ResponsiveRowColumnItem(
            child: ResponsiveRowColumn(
              layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                  ? ResponsiveRowColumnType.COLUMN
                  : ResponsiveRowColumnType.ROW,
              rowSpacing: 16,
              columnSpacing: 16,
              columnMainAxisSize: MainAxisSize.min,
              children: [
                ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(context.loc.code),
                      const SizedBox(height: 8),
                      ShadInput(
                        placeholder: Text(context.loc.codeHint),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        context.loc.codeDescription,
                        style: theme.textTheme.muted,
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
            child: Column(
              children: [
                SizedBox(height: 24),
                Divider(height: 1),
                SizedBox(height: 24),
              ],
            ),
          ),
          ResponsiveRowColumnItem(
            child: TitleHeading(
              title: context.loc.whoCanUseThisCode,
              description: context.loc.whoCanUseThisCodeDescription,
            ),
          ),
          const ResponsiveRowColumnItem(
            child: Column(
              children: [
                SizedBox(height: 24),
                Divider(height: 1),
                SizedBox(height: 24),
              ],
            ),
          ),
          ResponsiveRowColumnItem(
            child: TitleHeading(
              title: context.loc.promotionApplicability,
              description: context.loc.promotionApplicabilityDescription,
            ),
          ),
          ResponsiveRowColumnItem(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: conditions.length,
              itemBuilder: (context, index) {
                return ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: ConditionSelect(
                    showLabel: index > 0,
                    attributes: attributes,
                    onAttributeSelected: (attribute) {
                      onAttributeSelected(index, attribute);
                    },
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 12);
              },
            ),
          ),
          ResponsiveRowColumnItem(
            child: Row(
              children: [
                ShadButton.secondary(
                  size: ShadButtonSize.sm,
                  onPressed: onAddCondition,
                  child: Text(context.loc.addCondition),
                ),
                const SizedBox(width: 16),
                ShadButton.ghost(
                  size: ShadButtonSize.sm,
                  onPressed: onClearAll,
                  child: Text(context.loc.clearAll),
                ),
              ],
            ),
          ),
          const ResponsiveRowColumnItem(
            child: SizedBox(height: 64),
          ),
        ],
      ),
    );
  }
}
