import 'package:equatable/equatable.dart';
import 'package:zentrio_admin/utils/extensions/string_ext.dart';

class MediaFile extends Equatable {
  final String name;
  final String mimeType;
  final int size;
  final String url;
  final bool isThumbnail;

  const MediaFile(
    this.name,
    this.size,
    this.mimeType,
    this.url, {
    this.isThumbnail = false,
  });

  String get sizeFormatted => size.formatBytes(2);

  MediaFile copyWith({
    String? name,
    String? mimeType,
    int? size,
    String? url,
    bool? isThumbnail,
  }) {
    return MediaFile(
      name ?? this.name,
      size ?? this.size,
      mimeType ?? this.mimeType,
      url ?? this.url,
      isThumbnail: isThumbnail ?? this.isThumbnail,
    );
  }

  @override
  List<Object?> get props => [
        name,
        size,
        mimeType,
        url,
        isThumbnail,
      ];
}
