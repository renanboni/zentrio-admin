import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:zentrio_admin/presentation/components/product_variants_table.dart';

import '../../../../../domain/models/product_variant.dart';

class CreateProductVariantsForm extends StatelessWidget {
  final List<ProductVariant> variants;
  final CurrencyTextInputFormatter formatter;
  final Function(int index, bool manageInventory)? onManageInventoryChanged;
  final Function(int index, bool allowBackorder)? onAllowBackorderChanged;
  final Function(int index, bool hasInventoryKit)? onHasInventoryKitChanged;
  final Function(int index, String title)? onTitleChanged;
  final Function(int index, String sku)? onSkuChanged;
  final Function(int index, num price)? onPriceChanged;

  const CreateProductVariantsForm({
    super.key,
    required this.variants,
    required this.formatter,
    this.onManageInventoryChanged,
    this.onAllowBackorderChanged,
    this.onHasInventoryKitChanged,
    this.onTitleChanged,
    this.onSkuChanged,
    this.onPriceChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ProductVariantsTable(
      formatter: formatter,
      variants: variants,
      onManageInventoryChanged: onManageInventoryChanged,
      onAllowBackorderChanged: onAllowBackorderChanged,
      onHasInventoryKitChanged: onHasInventoryKitChanged,
      onTitleChanged: onTitleChanged,
      onSkuChanged: onSkuChanged,
      onPriceChanged: onPriceChanged,
      columns: const [
        ProductVariantTableColumn.options,
        ProductVariantTableColumn.title,
        ProductVariantTableColumn.sku,
        ProductVariantTableColumn.manageInventory,
        ProductVariantTableColumn.allowBackorder,
        ProductVariantTableColumn.hasInventoryKit,
        ProductVariantTableColumn.price,
      ],
    );
  }
}
