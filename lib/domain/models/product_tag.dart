import 'package:equatable/equatable.dart';

class ProductTag extends Equatable {
  final String id;
  final String value;
  final Map<String, dynamic> metadata;
  final String createdAt;
  final String updatedAt;
  final bool selected;

  const ProductTag({
    required this.id,
    required this.value,
    this.createdAt = '',
    this.updatedAt = '',
    this.metadata = const {},
    this.selected = false,
  });

  factory ProductTag.empty() {
    return const ProductTag(
      id: '',
      value: '',
      createdAt: '',
      updatedAt: '',
      metadata: {},
      selected: false,
    );
  }

  ProductTag copyWith({
    String? id,
    String? value,
    Map<String, dynamic>? metadata,
    String? createdAt,
    String? updatedAt,
    bool? selected,
  }) {
    return ProductTag(
      id: id ?? this.id,
      value: value ?? this.value,
      metadata: metadata ?? this.metadata,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      selected: selected ?? this.selected,
    );
  }

  @override
  List<Object?> get props => [
        id,
        value,
        metadata,
        createdAt,
        updatedAt,
        selected,
      ];
}
