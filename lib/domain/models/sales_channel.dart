
import 'package:equatable/equatable.dart';

class SalesChannel extends Equatable {
  final String id;
  final String name;
  final String description;
  final bool isDisabled;
  final Map<String, dynamic> metadata;

  const SalesChannel({
    required this.id,
    required this.name,
    required this.description,
    required this.isDisabled,
    required this.metadata,
  });

  factory SalesChannel.empty() {
    return const SalesChannel(
      id: "",
      name: "",
      description: "",
      isDisabled: false,
      metadata: {},
    );
  }

  @override
  List<Object?> get props => [id, name, description, isDisabled, metadata];
}