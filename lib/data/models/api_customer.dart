
import 'package:json_annotation/json_annotation.dart';

part 'api_customer.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ApiCustomer {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? companyName;
  final String? email;
  final String? phone;
  final bool? hasAccount;
  final Map<String, dynamic>? metadata;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;

  ApiCustomer({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.companyName,
    required this.email,
    required this.phone,
    required this.hasAccount,
    required this.metadata,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory ApiCustomer.fromJson(Map<String, dynamic> json) => _$ApiCustomerFromJson(json);

  Map<String, dynamic> toJson() => _$ApiCustomerToJson(this);
}