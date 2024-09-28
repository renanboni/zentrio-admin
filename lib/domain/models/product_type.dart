
import 'package:equatable/equatable.dart';

class ProductType extends Equatable {
  final String id;
  final String value;

  const ProductType({
    required this.id,
    required this.value,
  });

  factory ProductType.empty() {
    return const ProductType(id: '', value: '');
  }

  @override
  List<Object?> get props => [id, value];
}
