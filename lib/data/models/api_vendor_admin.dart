
import 'package:json_annotation/json_annotation.dart';
import 'package:zentrio_admin/data/models/res/api_vendor.dart';

part 'api_vendor_admin.g.dart';

@JsonSerializable()
class ApiVendorAdmin {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final ApiVendor? vendor;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;

  ApiVendorAdmin({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.vendor,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory ApiVendorAdmin.fromJson(Map<String, dynamic> json) => _$ApiVendorAdminFromJson(json);

  Map<String, dynamic> toJson() => _$ApiVendorAdminToJson(this);
}