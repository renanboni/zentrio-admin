import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/presentation/features/promotions/create/models/promotion_attribute.dart';
import 'package:zentrio_admin/utils/extensions/localization_ext.dart';
import 'package:zentrio_admin/utils/extensions/miscellaneous_ext.dart';
import 'package:zentrio_admin/utils/extensions/sizes_ext.dart';

class ConditionSelect extends StatelessWidget {
  final List<PromotionAttribute> attributes;
  final ValueChanged<PromotionAttribute> onAttributeSelected;
  final bool showLabel;

  const ConditionSelect({
    super.key,
    required this.attributes,
    required this.onAttributeSelected,
    this.showLabel = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showLabel) ...[
          ShadBadge.secondary(
            child: Text(context.loc.and),
          ),
          const SizedBox(height: 8),
        ],
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: theme.colorScheme.primaryForeground,
          ),
          padding: 8.paddingAll(),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: ShadSelect<PromotionAttribute>(
                            placeholder: Text(context.loc.selectAttribute),
                            decoration: ShadDecoration(
                                color: theme.colorScheme.background),
                            onChanged: onAttributeSelected,
                            options: attributes
                                .where((e) => !e.selected)
                                .map(
                                  (attribute) => ShadOption(
                                    value: attribute,
                                    child: Text(
                                        _getAttributeName(context, attribute)),
                                  ),
                                )
                                .toList(),
                            selectedOptionBuilder: (context, value) =>
                                Text(_getAttributeName(context, value)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Expanded(
                          child: ShadSelect<PromotionAttribute>(
                            decoration: ShadDecoration(
                                color: theme.colorScheme.background),
                            placeholder: Text("Select attribute"),
                            options: attributes
                                .map(
                                  (attribute) => ShadOption(
                                    value: attribute,
                                    child: Text(
                                        _getAttributeName(context, attribute)),
                                  ),
                                )
                                .toList(),
                            selectedOptionBuilder: (context, value) =>
                                Text(_getAttributeName(context, value)),
                          ),
                        ),
                        Expanded(
                          child: ShadSelect<PromotionAttribute>(
                            placeholder: Text("Select attribute"),
                            decoration: ShadDecoration(
                                color: theme.colorScheme.background),
                            options: attributes
                                .map(
                                  (attribute) => ShadOption(
                                    value: attribute,
                                    child: Text(
                                        _getAttributeName(context, attribute)),
                                  ),
                                )
                                .toList(),
                            selectedOptionBuilder: (context, value) =>
                                Text(_getAttributeName(context, value)),
                          ),
                        )
                      ].separatedBy(const SizedBox(width: 4)),
                    )
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(LucideIcons.x),
              )
            ],
          ),
        ),
      ],
    );
  }

  String _getAttributeName(BuildContext context, PromotionAttribute attribute) {
    switch (attribute.type) {
      case PromotionAttributeType.product:
        return context.loc.product;
      case PromotionAttributeType.collection:
        return context.loc.collection;
      case PromotionAttributeType.productType:
        return context.loc.product;
      case PromotionAttributeType.productTag:
        return context.loc.product;
    }
  }
}
