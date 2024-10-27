import 'package:equatable/equatable.dart';

class Campaign extends Equatable {
  final String? id;
  final String name;
  final String description;
  final String campaignIdentifier;
  final String startsAt;
  final String endsAt;

  const Campaign({
    this.id,
    required this.name,
    required this.description,
    required this.campaignIdentifier,
    required this.startsAt,
    required this.endsAt,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        campaignIdentifier,
        startsAt,
        endsAt,
      ];
}
