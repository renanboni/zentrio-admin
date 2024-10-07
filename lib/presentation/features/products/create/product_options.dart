import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:tuple/tuple.dart';
import 'package:zentrio_admin/domain/models/product_option.dart';
import 'package:zentrio_admin/domain/models/product_option_value.dart';
import 'package:zentrio_admin/presentation/components/action_item_list.dart';
import 'package:zentrio_admin/presentation/components/form_action_label.dart';
import 'package:zentrio_admin/presentation/features/products/create/product_option_list_item.dart';
import 'package:zentrio_admin/utils/extensions/sizes_ext.dart';

import '../../../../domain/models/product_variant.dart';

class ProductOptions extends StatelessWidget {
  final List<ProductOption> productOptions;
  final List<ProductVariant> productVariants;
  final VoidCallback onAddProductOption;
  final ValueChanged<int> onRemove;
  final Function(int index, String title) onTitleChanged;
  final Function(int index, List<ProductOptionValue> options) onValuesChanged;
  final Function(int index, String value) onValueRemoved;
  final bool showAddOptionsAlert;

  const ProductOptions({
    super.key,
    required this.productOptions,
    required this.productVariants,
    this.showAddOptionsAlert = false,
    required this.onAddProductOption,
    required this.onTitleChanged,
    required this.onValuesChanged,
    required this.onValueRemoved,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormActionLabel(
          title: "Product options",
          description:
              "Define the options for the product, e.g. color, size, etc.",
          cta: "Add",
          onPressed: onAddProductOption,
        ),
        const SizedBox(height: 16),
        ListView.separated(
          key: ValueKey(productOptions.length),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: productOptions.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) => ProductOptionListItem(
            enabled: index != 0,
            productOption: productOptions[index],
            onRemove: () => onRemove(index),
            onTitleChanged: (value) => onTitleChanged(index, value),
            onValuesChanged: (values) => onValuesChanged(index, values),
            onValueRemoved: (value) => onValueRemoved(index, value),
          ),
        ),
        const SizedBox(height: 16),
        const FormActionLabel(
          title: "Product variants",
          description:
              "This ranking will affect the variants' order in your storefront.",
        ),
        const SizedBox(height: 16),
        _ProductVariants(
          options: productOptions,
          variants: productVariants,
        ),
        if (showAddOptionsAlert)
          const ShadAlert(
            iconSrc: LucideIcons.info,
            description: Text('Add options to create variants.'),
          ),
      ],
    );
  }
}

class _ProductVariants extends StatelessWidget {
  final List<ProductOption> options;
  final List<ProductVariant> variants;

  const _ProductVariants({
    required this.options,
    required this.variants,
  });

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      padding: 0.paddingAll(),
      child: Column(
        children: [
          _ProductVariantsHeader(options: options),
          const Divider(height: 1),
          _ProductVariantsTable(variants: variants),
        ],
      ),
    );
  }
}

class _ProductVariantsHeader extends StatelessWidget {
  final List<ProductOption> options;

  const _ProductVariantsHeader({
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ShadTheme.of(context).colorScheme.primaryForeground,
      padding: 12.paddingAll(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const ShadCheckbox(value: false),
          const SizedBox(width: 16),
          for (final option in options)
            if (option != ProductOption.empty())
              Expanded(child: Text(option.title)),
        ],
      ),
    );
  }
}

class _ProductVariantsTable extends StatelessWidget {
  final List<ProductVariant> variants;

  const _ProductVariantsTable({
    required this.variants,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: variants.length,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final variant = variants[index];
        return _ProductVariantItemList(variant: variant);
      },
    );
  }
}

class _ProductVariantItemList extends StatelessWidget {
  final ProductVariant variant;

  const _ProductVariantItemList({
    required this.variant,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Padding(
      padding: 12.paddingAll(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const ShadCheckbox(value: false),
          const SizedBox(width: 16),
          for (final value in variant.options.values)
            Expanded(
              child: Text(
                value,
                style: theme.textTheme.muted,
              ),
            ),
        ],
      ),
    );
  }
}
