
import 'package:json_annotation/json_annotation.dart';

part 'api_sales_channel.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ApiSalesChannel {
  final String? id;
  final String? name;
  final String? description;
  final bool? isDisabled;
  final Map<String, dynamic>? metadata;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;

  ApiSalesChannel({
    this.id,
    this.name,
    this.description,
    this.isDisabled,
    this.metadata,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory ApiSalesChannel.fromJson(Map<String, dynamic> json) => _$ApiSalesChannelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiSalesChannelToJson(this);
}