
import 'package:json_annotation/json_annotation.dart';
import 'package:zentrio_admin/data/models/api_publishable_key.dart';

part 'api_key_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ApiKeyResponse {
  final ApiPublishableKey apiKey;

  ApiKeyResponse({
    required this.apiKey,
  });

  factory ApiKeyResponse.fromJson(Map<String, dynamic> json) => _$ApiKeyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiKeyResponseToJson(this);
}