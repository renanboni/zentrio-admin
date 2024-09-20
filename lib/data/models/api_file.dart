
import 'package:json_annotation/json_annotation.dart';

part 'api_file.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ApiFile {
  final String id;
  final String url;

  ApiFile({
    required this.id,
    required this.url,
  });

  factory ApiFile.fromJson(Map<String, dynamic> json) => _$ApiFileFromJson(json);

  Map<String, dynamic> toJson() => _$ApiFileToJson(this);
}
