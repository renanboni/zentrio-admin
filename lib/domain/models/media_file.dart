import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:zentrio_admin/utils/extensions/string_ext.dart';

class MediaFile extends Equatable {
  final String name;
  final String mimeType;
  final int size;
  final Uint8List data;
  final bool isThumbnail;

  const MediaFile(
    this.name,
    this.size,
    this.mimeType,
    this.data, {
    this.isThumbnail = false,
  });

  String get sizeFormatted => size.formatBytes(2);

  MediaFile copyWith({
    String? name,
    String? mimeType,
    int? size,
    Uint8List? data,
    bool? isThumbnail,
  }) {
    return MediaFile(
      name ?? this.name,
      size ?? this.size,
      mimeType ?? this.mimeType,
      data ?? this.data,
      isThumbnail: isThumbnail ?? this.isThumbnail,
    );
  }

  @override
  List<Object?> get props => [
        name,
        size,
        mimeType,
        data,
        isThumbnail,
      ];
}
