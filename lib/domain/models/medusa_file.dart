
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'medusa_file.g.dart';

@JsonSerializable()
class MedusaFile extends Equatable {
  final String id;
  final String url;
  final bool selected;

  const MedusaFile({
    this.id = "",
    this.url = "",
    this.selected = false,
  });

  MedusaFile copyWith({
    String? id,
    String? url,
    bool? selected,
  }) {
    return MedusaFile(
      id: id ?? this.id,
      url: url ?? this.url,
      selected: selected ?? this.selected,
    );
  }

  @override
  List<Object?> get props => [id, url, selected];

  Map<String, dynamic> toJson() => _$MedusaFileToJson(this);

  factory MedusaFile.fromJson(Map<String, dynamic> json) => _$MedusaFileFromJson(json);
}