import 'package:equatable/equatable.dart';

/// This class represents a store.

class Vendor extends Equatable {
  final String id;
  final String handle;
  final String name;
  final String logo;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  const Vendor({
    required this.id,
    required this.handle,
    required this.name,
    required this.logo,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  @override
  List<Object?> get props => [
        id,
        handle,
        name,
        logo,
        createdAt,
        updatedAt,
        deletedAt,
      ];
}
