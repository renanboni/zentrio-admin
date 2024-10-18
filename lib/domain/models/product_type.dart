import 'package:equatable/equatable.dart';

class ProductType extends Equatable {
  final String id;
  final String value;
  final Map<String, dynamic> metadata;

  const ProductType({
    required this.id,
    required this.value,
    this.metadata = const {},
  });

  factory ProductType.empty() {
    return const ProductType(id: '', value: '', metadata: {});
  }

  @override
  List<Object?> get props => [id, value, metadata];
}
