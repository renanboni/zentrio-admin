
import 'package:json_annotation/json_annotation.dart';

part 'create_sales_channel_req.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CreateSalesChannelReq {
  final String? id;
  final String? name;
  final String? description;
  final bool? isDisabled;

  CreateSalesChannelReq({
    this.id,
    this.name,
    this.description,
    this.isDisabled,
  });

  factory CreateSalesChannelReq.fromJson(Map<String, dynamic> json) => _$CreateSalesChannelReqFromJson(json);

  Map<String, dynamic> toJson() => _$CreateSalesChannelReqToJson(this);

  @override
  String toString() {
    return 'CreateSalesChannelReq{id: $id, name: $name, description: $description, isDisabled: $isDisabled}';
  }
}