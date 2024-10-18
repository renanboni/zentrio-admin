import 'package:equatable/equatable.dart';

class ProductType extends Equatable {
  final String id;
  final String value;
  final Map<String, dynamic> metadata;
  final String createdAt;
  final String updatedAt;

  const ProductType({
    required this.id,
    required this.value,
    this.createdAt = '',
    this.updatedAt = '',
    this.metadata = const {},
  });

  factory ProductType.empty() {
    return const ProductType(
      id: '',
      value: '',
      createdAt: '',
      updatedAt: '',
      metadata: {},
    );
  }

  @override
  List<Object?> get props => [id, value, metadata, createdAt, updatedAt];
}
