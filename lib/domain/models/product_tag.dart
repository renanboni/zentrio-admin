
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';


class ProductTag extends Equatable {
  final String id;
  final String value;
  final Map<String, dynamic> metadata;

  const ProductTag({
    required this.id,
    required this.value,
    this.metadata = const {},
  });

  factory ProductTag.empty() {
    return const ProductTag(id: '', value: '', metadata: {});
  }

  @override
  List<Object?> get props => [id, value, metadata];
}
