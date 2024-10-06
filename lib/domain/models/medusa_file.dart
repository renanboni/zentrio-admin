
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'medusa_file.g.dart';

@JsonSerializable()
class MedusaFile extends Equatable {
  final String id;
  final String url;

  const MedusaFile(
    this.id,
    this.url,
  );

  @override
  List<Object?> get props => [id, url];

  Map<String, dynamic> toJson() => _$MedusaFileToJson(this);

  factory MedusaFile.fromJson(Map<String, dynamic> json) => _$MedusaFileFromJson(json);
}