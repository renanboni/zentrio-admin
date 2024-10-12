
import 'package:json_annotation/json_annotation.dart';

part 'api_banner_image.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class ApiBannerImage {
  final String? id;
  final int? position;
  final String? fileId;
  final String? mimeType;
  final bool? isMobile;

  ApiBannerImage({
    this.id,
    this.position,
    this.fileId,
    this.mimeType,
    this.isMobile,
  });

  factory ApiBannerImage.fromJson(Map<String, dynamic> json) => _$ApiBannerImageFromJson(json);

  Map<String, dynamic> toJson() => _$ApiBannerImageToJson(this);

  @override
  String toString() {
    return 'ApiBannerImage(id: $id, position: $position, fileId: $fileId, mimeType: $mimeType, isMobile: $isMobile)';
  }
}