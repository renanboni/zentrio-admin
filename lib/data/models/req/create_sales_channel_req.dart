
import 'package:json_annotation/json_annotation.dart';

part 'create_sales_channel_req.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CreateSalesChannelReq {
  final String? id;

  CreateSalesChannelReq({
    this.id,
  });

  factory CreateSalesChannelReq.fromJson(Map<String, dynamic> json) => _$CreateSalesChannelReqFromJson(json);

  Map<String, dynamic> toJson() => _$CreateSalesChannelReqToJson(this);
}