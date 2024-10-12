import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:zentrio_admin/utils/extensions/string_ext.dart';

class MediaFile extends Equatable {
  final String name;
  final String mimeType;
  final int size;
  final String url;
  final bool isThumbnail;
  final Uint8List? bytes;

  const MediaFile(
    this.name,
    this.size,
    this.mimeType,
    this.bytes,
    this.url, {
    this.isThumbnail = false,
  });

  factory MediaFile.empty() {
    return const MediaFile(
      '',
      0,
      '',
      null,
      '',
    );
  }

  String get sizeFormatted => size.formatBytes(2);

  MediaFile copyWith({
    String? name,
    int? size,
    String? mimeType,
    String? url,
    bool? isThumbnail,
    Uint8List? bytes,
  }) {
    return MediaFile(
      name ?? this.name,
      size ?? this.size,
      mimeType ?? this.mimeType,
      bytes ?? this.bytes,
      url ?? this.url,
      isThumbnail: isThumbnail ?? this.isThumbnail,
    );
  }

  @override
  List<Object?> get props => [
        name,
        url,
      ];
}
