import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'metadata.g.dart';

@JsonSerializable()
class Metadata extends Equatable {
  final String key;
  final Object value;

  const Metadata({
    required this.key,
    required this.value,
  });

  factory Metadata.empty() {
    return const Metadata(
      key: "",
      value: "",
    );
  }

  Metadata copyWith({
    String? key,
    Object? value,
  }) {
    return Metadata(
      key: key ?? this.key,
      value: value ?? this.value,
    );
  }

  @override
  List<Object> get props => [key, value];

  Map<String, dynamic> toJson() => _$MetadataToJson(this);

  factory Metadata.fromJson(Map<String, dynamic> json) => _$MetadataFromJson(json);
}
