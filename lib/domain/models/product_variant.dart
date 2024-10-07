
import 'package:equatable/equatable.dart';

class ProductVariant extends Equatable {
  final String title;
  final Map<String, String> options;

  const ProductVariant({
    required this.title,
    required this.options,
  });

  @override
  List<Object?> get props => [title, options];
}
