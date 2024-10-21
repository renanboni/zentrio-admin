import 'package:equatable/equatable.dart';

class ProductTag extends Equatable {
  final String id;
  final String value;
  final Map<String, dynamic> metadata;
  final String createdAt;
  final String updatedAt;

  const ProductTag({
    required this.id,
    required this.value,
    this.createdAt = '',
    this.updatedAt = '',
    this.metadata = const {},
  });

  factory ProductTag.empty() {
    return const ProductTag(
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
