
import 'package:equatable/equatable.dart';

class ProductTag extends Equatable {
  final String id;
  final String value;

  const ProductTag({
    required this.id,
    required this.value,
  });

  factory ProductTag.empty() {
    return const ProductTag(id: '', value: '');
  }

  @override
  List<Object?> get props => [id, value];
}
