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

  @override
  List<Object?> get props => [
        title,
        values,
      ];
}
