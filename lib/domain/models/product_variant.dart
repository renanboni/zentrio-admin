
import 'package:equatable/equatable.dart';

class ProductVariant extends Equatable {
  final String title;
  final Map<String, String> options;
  final bool selected;

  const ProductVariant({
    required this.title,
    required this.options,
    this.selected = false,
  });

  ProductVariant copyWith({
    String? title,
    Map<String, String>? options,
    bool? selected,
  }) {
    return ProductVariant(
      title: title ?? this.title,
      options: options ?? this.options,
      selected: selected ?? this.selected,
    );
  }

  @override
  List<Object?> get props => [title, options];
}
