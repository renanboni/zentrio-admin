import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_option.g.dart';

@JsonSerializable()
class ProductOption extends Equatable {
  final String id;
  final String title;
  final List<String> values;

  const ProductOption({
    required this.title,
    required this.values,
    required this.id,
  });

  ProductOption.empty()
      : id = "",
        title = "",
        values = [];

  ProductOption copyWith({
    String? id,
    String? title,
    List<String>? values,
  }) {
    return ProductOption(
      id: id ?? this.id,
      title: title ?? this.title,
      values: values ?? this.values,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        values,
      ];

  Map<String, dynamic> toJson() => _$ProductOptionToJson(this);

  factory ProductOption.fromJson(Map<String, dynamic> json) =>
      _$ProductOptionFromJson(json);
}
