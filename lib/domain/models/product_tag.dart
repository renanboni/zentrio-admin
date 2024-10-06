
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_tag.g.dart';

@JsonSerializable()
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

  Map<String, dynamic> toJson() => _$ProductTagToJson(this);

  factory ProductTag.fromJson(Map<String, dynamic> json) => _$ProductTagFromJson(json);
}
