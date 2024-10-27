
import 'package:json_annotation/json_annotation.dart';
import 'package:zentrio_admin/data/models/api_collection.dart';
import 'package:zentrio_admin/data/models/api_customer.dart';

import 'api_paginated_response.dart';

part 'customers_response.g.dart';

@JsonSerializable()
class CustomersResponse extends ApiPaginatedResponse<ApiCustomer> {
  CustomersResponse({
    required super.count,
    required super.offset,
    required super.limit,
    required super.data,
  });

  factory CustomersResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CustomersResponseToJson(this);
}
