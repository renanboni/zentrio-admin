
import 'package:json_annotation/json_annotation.dart';

part 'api_publishable_key.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ApiPublishableKey {
  final String? id;
  final String? title;
  final String? token;
  final String? redacted;
  final String? type;
  final String? createdBy;

  ApiPublishableKey({
    this.id,
    this.title,
    this.token,
    this.redacted,
    this.type,
    this.createdBy,
  });

  factory ApiPublishableKey.fromJson(Map<String, dynamic> json) => _$ApiPublishableKeyFromJson(json);

  Map<String, dynamic> toJson() => _$ApiPublishableKeyToJson(this);
}