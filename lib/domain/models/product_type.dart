
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_type.g.dart';

@JsonSerializable()
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

  Map<String, dynamic> toJson() => _$ProductTypeToJson(this);

  factory ProductType.fromJson(Map<String, dynamic> json) => _$ProductTypeFromJson(json);
}
