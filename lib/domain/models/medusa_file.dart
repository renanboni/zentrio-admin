
import 'package:equatable/equatable.dart';

class MedusaFile extends Equatable {
  final String id;
  final String url;

  const MedusaFile(
    this.id,
    this.url,
  );

  @override
  List<Object?> get props => [id, url];
}