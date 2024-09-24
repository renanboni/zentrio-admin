import 'package:equatable/equatable.dart';

class ApiKey extends Equatable {
  final String id;
  final String title;
  final String token;
  final String redacted;
  final String type;
  final String createdBy;

  const ApiKey({
    required this.id,
    required this.title,
    required this.token,
    required this.redacted,
    required this.type,
    required this.createdBy,
  });

  factory ApiKey.empty() {
    return const ApiKey(
      id: '',
      title: '',
      token: '',
      redacted: '',
      type: '',
      createdBy: '',
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        token,
        redacted,
        type,
        createdBy,
      ];
}
