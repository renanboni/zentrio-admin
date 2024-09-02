
import 'package:json_annotation/json_annotation.dart';

import 'api_vendor.dart';

part 'api_vendors.g.dart';

@JsonSerializable()
class VendorsResponse {
  final List<ApiVendor> vendors;

  VendorsResponse({
    required this.vendors,
  });

  factory VendorsResponse.fromJson(Map<String, dynamic> json) =>
      _$VendorsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VendorsResponseToJson(this);
}
