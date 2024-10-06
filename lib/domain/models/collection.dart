import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:zentrio_admin/domain/models/product.dart';

part 'collection.g.dart';

@JsonSerializable()
class Collection extends Equatable {
  final String id;
  final String title;
  final String handle;
  final List<Product> products;

  const Collection({
    required this.id,
    required this.title,
    required this.handle,
    this.products = const [],
  });

  factory Collection.empty() {
    return const Collection(
      id: '',
      title: '',
      handle: '',
      products: [],
    );
  }

  @override
  List<Object?> get props => [id, title, handle, products];

  Map<String, dynamic> toJson() => _$CollectionToJson(this);

  factory Collection.fromJson(Map<String, dynamic> json) => _$CollectionFromJson(json);
}
