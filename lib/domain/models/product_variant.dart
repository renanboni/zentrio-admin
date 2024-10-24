import 'package:equatable/equatable.dart';
import 'package:zentrio_admin/domain/models/price.dart';

class ProductVariant extends Equatable {
  final String? id;
  final String title;
  final String sku;
  final Map<String, String> options;
  final bool manageInventory;
  final bool allowBackorder;
  final bool hasInventoryKit;
  final bool selected;
  final List<Price> prices;

  const ProductVariant({
    this.id,
    required this.title,
    required this.options,
    this.sku = "",
    this.manageInventory = false,
    this.allowBackorder = false,
    this.hasInventoryKit = false,
    this.selected = false,
    this.prices = const [],
  });

  factory ProductVariant.defaultVariant() {
    return const ProductVariant(
      title: "Default",
      options: {"Default Option": "Default Option Value"},
    );
  }

  ProductVariant copyWith({
    String? id,
    String? title,
    String? sku,
    Map<String, String>? options,
    bool? manageInventory,
    bool? allowBackorder,
    bool? hasInventoryKit,
    bool? selected,
    List<Price>? prices,
  }) {
    return ProductVariant(
      id: id ?? this.id,
      title: title ?? this.title,
      sku: sku ?? this.sku,
      options: options ?? this.options,
      manageInventory: manageInventory ?? this.manageInventory,
      allowBackorder: allowBackorder ?? this.allowBackorder,
      hasInventoryKit: hasInventoryKit ?? this.hasInventoryKit,
      selected: selected ?? this.selected,
      prices: prices ?? this.prices,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        options,
        sku,
        manageInventory,
        allowBackorder,
        hasInventoryKit,
        selected,
        prices,
      ];
}
