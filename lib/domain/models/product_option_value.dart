
import 'package:equatable/equatable.dart';

class ProductOptionValue extends Equatable {
  final String id;
  final String value;

  const ProductOptionValue({
    required this.id,
    required this.value,
  });

  const ProductOptionValue.empty()
      : id = "",
        value = "";

  ProductOptionValue copyWith({
    String? id,
    String? value,
  }) {
    return ProductOptionValue(
      id: id ?? this.id,
      value: value ?? this.value,
    );
  }

  @override
  List<Object?> get props => [
        id,
        value,
      ];
}