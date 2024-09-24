
import 'package:json_annotation/json_annotation.dart';
import 'package:zentrio_admin/data/models/res/api_vendor.dart';

part 'vendor_response.g.dart';

@JsonSerializable()
class VendorResponse {
  final ApiVendor vendor;

  VendorResponse({required this.vendor});

  factory VendorResponse.fromJson(Map<String, dynamic> json) => _$VendorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VendorResponseToJson(this);
}