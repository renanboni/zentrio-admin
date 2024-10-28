import 'package:equatable/equatable.dart';

enum PromotionAttributeType {
  product,
  collection,
  productType,
  productTag,
}

class PromotionAttribute extends Equatable {
  final PromotionAttributeType type;
  final bool selected;

  const PromotionAttribute({
    required this.type,
    this.selected = false,
  });

  PromotionAttribute copyWith({
    PromotionAttributeType? type,
    bool? selected,
  }) {
    return PromotionAttribute(
      type: type ?? this.type,
      selected: selected ?? this.selected,
    );
  }

  @override
  List<Object?> get props => [type, selected];
}
