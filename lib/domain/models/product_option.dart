import 'package:equatable/equatable.dart';

class ProductOption extends Equatable {
  final String title;
  final List<String> values;

  const ProductOption({
    required this.title,
    required this.values,
  });

  ProductOption.empty()
      : title = "",
        values = [];

  ProductOption copyWith({
    String? title,
    List<String>? values,
  }) {
    return ProductOption(
      title: title ?? this.title,
      values: values ?? this.values,
    );
  }

  @override
  List<Object?> get props => [
        title,
        values,
      ];
}
