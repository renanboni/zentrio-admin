import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/domain/models/promotion_type.dart';
import 'package:zentrio_admin/presentation/components/radio_item_list.dart';
import 'package:zentrio_admin/utils/extensions/localization_ext.dart';
import 'package:zentrio_admin/utils/extensions/miscellaneous_ext.dart';

class PromotionTypeForm extends StatelessWidget {
  final PromotionType selectedType;
  final ValueChanged<PromotionType> onTypeChanged;

  const PromotionTypeForm({
    super.key,
    required this.selectedType,
    required this.onTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 48),
        Text(
          context.loc.types,
          style: theme.textTheme.small,
        ),
        RadioItemList(
          title: context.loc.amountOffProducts,
          description: context.loc.amountOffProductsDescription,
          value: selectedType == PromotionType.amountOffProducts,
          onTap: () => onTypeChanged(PromotionType.amountOffProducts),
        ),
        RadioItemList(
          title: context.loc.amountOffOrder,
          description: context.loc.amountOffOrderDescription,
          value: selectedType == PromotionType.amountOffOrder,
          onTap: () => onTypeChanged(PromotionType.amountOffOrder),
        ),
        RadioItemList(
          title: context.loc.percentageOffProducts,
          description: context.loc.percentageOffProductsDescription,
          value: selectedType == PromotionType.percentageOffProducts,
          onTap: () => onTypeChanged(PromotionType.percentageOffProducts),
        ),
        RadioItemList(
          title: context.loc.percentageOffOrder,
          description: context.loc.percentageOffOrderDescription,
          value: selectedType == PromotionType.percentageOffOrder,
          onTap: () => onTypeChanged(PromotionType.percentageOffOrder),
        ),
        RadioItemList(
          title: context.loc.buyXGetY,
          description: context.loc.buyXGetYDescription,
          value: selectedType == PromotionType.buyXGetY,
          onTap: () => onTypeChanged(PromotionType.buyXGetY),
        ),
      ].separatedBy(const SizedBox(height: 16)),
    );
  }
}
