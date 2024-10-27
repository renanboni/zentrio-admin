import 'package:json_annotation/json_annotation.dart';

part 'create_budget_req.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CreateBudgetReq {
  final String? type;
  final String? currencyCode;
  final num? limit;

  CreateBudgetReq({
    this.type,
    this.limit,
    this.currencyCode,
  });

  factory CreateBudgetReq.fromJson(Map<String, dynamic> json) =>
      _$CreateBudgetReqFromJson(json);

  Map<String, dynamic> toJson() => _$CreateBudgetReqToJson(this);
}
