import 'package:json_annotation/json_annotation.dart';

part 'api_product_option.g.dart';

@JsonSerializable()
class ApiProductOption {
  final String? title;
  final List<String>? values;

  ApiProductOption({
    required this.title,
    required this.values,
  });

  factory ApiProductOption.fromJson(Map<String, dynamic> json) {
    return ApiProductOption(
      title: json['title'],
      values: List<String>.from(json['values']),
    );
  }

  Map<String, dynamic> toJson() => _$ApiProductOptionToJson(this);
}