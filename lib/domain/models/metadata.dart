import 'package:equatable/equatable.dart';

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
}
