import 'package:flutter/cupertino.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:tuple/tuple.dart';
import 'package:zentrio_admin/domain/models/product_option.dart';
import 'package:zentrio_admin/domain/models/product_option_value.dart';
import 'package:zentrio_admin/presentation/components/form_action_label.dart';
import 'package:zentrio_admin/presentation/features/products/create/product_option_list_item.dart';

class ProductOptions extends StatelessWidget {
  final List<ProductOption> productOptions;
  final VoidCallback onAddProductOption;
  final ValueChanged<int> onRemove;
  final Function(int index, String title) onTitleChanged;
  final Function(int index, List<ProductOptionValue> options) onValuesChanged;
  final Function(int index, String value) onValueRemoved;
  final bool showAddOptionsAlert;

  const ProductOptions({
    super.key,
    required this.productOptions,
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
        if (showAddOptionsAlert)
          const ShadAlert(
            iconSrc: LucideIcons.info,
            description: Text('Add options to create variants.'),
          ),
      ],
    );
  }
}
