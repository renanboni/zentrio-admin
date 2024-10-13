
import 'package:equatable/equatable.dart';

class Customer extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  final String companyName;
  final String email;
  final String phone;
  final bool hasAccount;
  final Map<String, dynamic> metadata;

  const Customer({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.companyName,
    required this.email,
    required this.phone,
    required this.hasAccount,
    required this.metadata,
  });

  @override
  List<Object?> get props => [
    id,
    firstName,
    lastName,
    companyName,
    email,
    phone,
    hasAccount,
    metadata,
  ];
}