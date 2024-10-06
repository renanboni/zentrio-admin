import 'package:equatable/equatable.dart';
import 'package:zentrio_admin/domain/models/product_option_value.dart';

class ProductOption extends Equatable {
  final String id;
  final String title;
  final List<ProductOptionValue> values;

  const ProductOption({
    required this.title,
    required this.values,
    required this.id,
  });

  ProductOption.empty()
      : id = "",
        title = "",
        values = [];

  ProductOption copyWith({
    String? id,
    String? title,
    List<ProductOptionValue>? values,
  }) {
    return ProductOption(
      id: id ?? this.id,
      title: title ?? this.title,
      values: values ?? this.values,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        values,
      ];
}
