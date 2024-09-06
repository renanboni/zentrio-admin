
import 'package:json_annotation/json_annotation.dart';
import 'package:zentrio_admin/data/models/api_vendor_admin.dart';

part 'vendor_admin_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class VendorAdminResponse {
  final ApiVendorAdmin vendorAdmin;

  VendorAdminResponse({required this.vendorAdmin});

  factory VendorAdminResponse.fromJson(Map<String, dynamic> json) => _$VendorAdminResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VendorAdminResponseToJson(this);
}