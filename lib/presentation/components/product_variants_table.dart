import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/domain/models/product_variant.dart';

enum ProductVariantTableColumn {
  options,
  title,
  sku,
  manageInventory,
  allowBackorder,
  hasInventoryKit,
  price
}

class ProductVariantsTable extends StatelessWidget {
  final List<ProductVariant> variants;
  final List<ProductVariantTableColumn> columns;
  final CurrencyTextInputFormatter formatter;
  final Function(int index, bool manageInventory)? onManageInventoryChanged;
  final Function(int index, bool allowBackorder)? onAllowBackorderChanged;
  final Function(int index, bool hasInventoryKit)? onHasInventoryKitChanged;
  final Function(int index, String title)? onTitleChanged;
  final Function(int index, String sku)? onSkuChanged;
  final Function(int index, String price)? onPriceChanged;

  const ProductVariantsTable({
    super.key,
    required this.variants,
    required this.columns,
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
    final theme = ShadTheme.of(context);

    return ShadTable(
      pinnedRowCount: 1,
      builder: (context, index) {
        final variant = variants[index.row];
        final column = columns[index.column];

        switch (column) {
          case ProductVariantTableColumn.options:
            return ShadTableCell(
              style: theme.textTheme.muted,
              child: Text(
                variant.options.values.join(" / "),
                style: theme.textTheme.muted,
              ),
            );
          case ProductVariantTableColumn.title:
            return ShadTableCell(
              child: ShadInput(
                initialValue: variant.title,
                onChanged: (value) {
                  onTitleChanged?.call(index.row, value);
                },
                style: theme.textTheme.small,
                decoration: const ShadDecoration(
                  border: ShadBorder(),
                  focusedBorder: ShadBorder(),
                  shape: null,
                  fallbackToBorder: false,
                ),
              ),
            );
          case ProductVariantTableColumn.sku:
            return ShadTableCell(
              child: ShadInput(
                initialValue: variant.sku,
                onChanged: (value) {
                  onSkuChanged?.call(index.row, value);
                },
                style: theme.textTheme.small,
                decoration: const ShadDecoration(
                  border: ShadBorder(),
                  focusedBorder: ShadBorder(),
                  shape: null,
                  fallbackToBorder: false,
                ),
              ),
            );
          case ProductVariantTableColumn.manageInventory:
            return ShadTableCell(
              child: Center(
                child: ShadCheckbox(
                  value: variant.manageInventory,
                  onChanged: (value) {
                    onManageInventoryChanged?.call(index.row, value);
                  },
                ),
              ),
            );
          case ProductVariantTableColumn.allowBackorder:
            return ShadTableCell(
              child: Center(
                child: ShadCheckbox(
                  value: variant.allowBackorder,
                  onChanged: (value) {
                    onAllowBackorderChanged?.call(index.row, value);
                  },
                ),
              ),
            );
          case ProductVariantTableColumn.hasInventoryKit:
            return ShadTableCell(
              child: Center(
                child: ShadCheckbox(
                  value: variant.hasInventoryKit,
                  enabled: variant.manageInventory,
                  onChanged: (value) {
                    onHasInventoryKitChanged?.call(index.row, value);
                  },
                ),
              ),
            );
          case ProductVariantTableColumn.price:
            return ShadTableCell(
              child: ShadInput(
                onChanged: (value) {
                  onPriceChanged?.call(index.row, value);
                },
                //initialValue: formatter.format('2000'),
                inputFormatters: [formatter],
                keyboardType: TextInputType.number,
                style: theme.textTheme.small,
                decoration: const ShadDecoration(
                  border: ShadBorder(),
                  focusedBorder: ShadBorder(),
                  shape: null,
                  fallbackToBorder: false,
                ),
              ),
            );
          default:
            return const ShadTableCell(child: SizedBox());
        }
      },
      columnCount: columns.length,
      rowCount: variants.length,
      columnSpanExtent: (index) => const FixedTableSpanExtent(200),
      header: (context, column) {
        final columnType = columns[column];
        var columnName = "";
        var alignment = Alignment.centerLeft;

        switch (columnType) {
          case ProductVariantTableColumn.options:
            columnName = variants[0].options.keys.join(" / ");
            break;
          case ProductVariantTableColumn.title:
            columnName = "Title";
            break;
          case ProductVariantTableColumn.sku:
            columnName = "SKU";
            break;
          case ProductVariantTableColumn.manageInventory:
            columnName = "Manage Inventory";
            alignment = Alignment.center;
            break;
          case ProductVariantTableColumn.allowBackorder:
            columnName = "Allow Backorder";
            alignment = Alignment.center;
            break;
          case ProductVariantTableColumn.hasInventoryKit:
            columnName = "Has Inventory Kit";
            alignment = Alignment.center;
            break;
          case ProductVariantTableColumn.price:
            columnName = "Price";
            break;
          default:
            break;
        }

        return ShadTableCell.header(
          alignment: alignment,
          child: Text(columnName),
        );
      },
      columnSpanBackgroundDecoration: (index) {
        return SpanDecoration(
          border: SpanBorder(
            trailing: BorderSide(
              color: theme.colorScheme.border,
              width: 1,
            ),
            leading: BorderSide(
              color: theme.colorScheme.border,
              width: 1,
            ),
          ),
        );
      },
      rowSpanBackgroundDecoration: (index) {
        return SpanDecoration(
          color: index == 0 ? theme.colorScheme.primaryForeground : null,
          border: SpanBorder(
            trailing: BorderSide(
              color: theme.colorScheme.border,
              width: 1,
            ),
            leading: BorderSide(
              color: theme.colorScheme.border,
              width: 1,
            ),
          ),
        );
      },
    );
  }
}
