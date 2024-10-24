import 'package:json_annotation/json_annotation.dart';

part 'create_price_req.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CreatePriceReq {
  final String? id;
  final String? title;
  final String? currencyCode;
  final num? amount;
  final num? minQuantity;
  final num? maxQuantity;

  CreatePriceReq({
    this.id,
    this.title,
    this.currencyCode,
    this.amount,
    this.minQuantity,
    this.maxQuantity,
  });

  factory CreatePriceReq.fromJson(Map<String, dynamic> json) => _$CreatePriceReqFromJson(json);

  Map<String, dynamic> toJson() => _$CreatePriceReqToJson(this);

  @override
  String toString() {
    return 'CreatePriceReq{id: $id, title: $title, currencyCode: $currencyCode, amount: $amount, minQuantity: $minQuantity, maxQuantity: $maxQuantity}';
  }
}
