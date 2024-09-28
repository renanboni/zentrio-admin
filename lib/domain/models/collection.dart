import 'package:equatable/equatable.dart';

class Collection extends Equatable {
  final String id;
  final String title;
  final String handle;

  const Collection({
    required this.id,
    required this.title,
    required this.handle,
  });

  factory Collection.empty() {
    return const Collection(id: '', title: '', handle: '');
  }

  @override
  List<Object?> get props => [id, title, handle];
}
