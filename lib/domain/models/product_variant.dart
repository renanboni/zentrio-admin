import 'package:equatable/equatable.dart';

class ProductVariant extends Equatable {
  final String title;
  final String sku;
  final Map<String, String> options;
  final bool manageInventory;
  final bool allowBackorder;
  final bool hasInventoryKit;
  final bool selected;

  const ProductVariant({
    required this.title,
    required this.options,
    this.sku = "",
    this.manageInventory = false,
    this.allowBackorder = false,
    this.hasInventoryKit = false,
    this.selected = false,
  });

  factory ProductVariant.defaultVariant() {
    return const ProductVariant(
      title: "Default",
      options: {"Default option": "Default Option Value"},
    );
  }

  ProductVariant copyWith({
    String? title,
    String? sku,
    Map<String, String>? options,
    bool? manageInventory,
    bool? allowBackorder,
    bool? hasInventoryKit,
    bool? selected,
  }) {
    return ProductVariant(
      title: title ?? this.title,
      sku: sku ?? this.sku,
      options: options ?? this.options,
      manageInventory: manageInventory ?? this.manageInventory,
      allowBackorder: allowBackorder ?? this.allowBackorder,
      hasInventoryKit: hasInventoryKit ?? this.hasInventoryKit,
      selected: selected ?? this.selected,
    );
  }

  @override
  List<Object?> get props => [
        title,
        options,
        sku,
        manageInventory,
        allowBackorder,
        hasInventoryKit,
        selected,
      ];
}
