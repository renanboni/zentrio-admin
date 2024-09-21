
import 'package:json_annotation/json_annotation.dart';
import 'package:zentrio_admin/data/models/api_file.dart';

part 'files_response.g.dart';

@JsonSerializable()
class FilesResponse {
  final List<ApiFile> files;

  FilesResponse({
    required this.files,
  });

  factory FilesResponse.fromJson(Map<String, dynamic> json) => _$FilesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FilesResponseToJson(this);
}