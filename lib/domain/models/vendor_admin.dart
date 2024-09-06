import 'package:equatable/equatable.dart';
import 'package:zentrio_admin/domain/models/vendor.dart';

class VendorAdmin extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final Vendor vendor;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  const VendorAdmin({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.vendor,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        email,
        vendor,
        createdAt,
        updatedAt,
        deletedAt,
      ];
}
