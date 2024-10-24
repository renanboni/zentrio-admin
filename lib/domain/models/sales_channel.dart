
import 'package:equatable/equatable.dart';

class SalesChannel extends Equatable {
  final String id;
  final String name;
  final String description;
  final bool isDisabled;
  final Map<String, dynamic> metadata;
  final bool selected;

  const SalesChannel({
    required this.id,
    required this.name,
    required this.description,
    required this.isDisabled,
    required this.metadata,
    this.selected = false,
  });

  factory SalesChannel.empty() {
    return const SalesChannel(
      id: "",
      name: "",
      description: "",
      isDisabled: false,
      metadata: {},
      selected: false,
    );
  }

  SalesChannel copyWith({
    String? id,
    String? name,
    String? description,
    bool? isDisabled,
    Map<String, dynamic>? metadata,
    bool? selected,
  }) {
    return SalesChannel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      isDisabled: isDisabled ?? this.isDisabled,
      metadata: metadata ?? this.metadata,
      selected: selected ?? this.selected,
    );
  }

  @override
  List<Object?> get props => [id, name, description, isDisabled, metadata, selected];
}