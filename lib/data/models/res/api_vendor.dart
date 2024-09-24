
import 'package:json_annotation/json_annotation.dart';
import 'package:zentrio_admin/data/models/api_vendor_admin.dart';

part 'api_vendor.g.dart';

@JsonSerializable()
class ApiVendor {
  final String? id;
  final String? name;
  final String? logo;
  final String? handle;
  final String? createdAt;
  final String? updatedAt;
  final List<ApiVendorAdmin>? admins;

  ApiVendor({
    required this.id,
    required this.name,
    required this.logo,
    required this.handle,
    required this.admins,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ApiVendor.fromJson(Map<String, dynamic> json) => _$ApiVendorFromJson(json);

  Map<String, dynamic> toJson() => _$ApiVendorToJson(this);
}