import 'package:equatable/equatable.dart';
import 'package:zentrio_admin/domain/models/product.dart';

class Collection extends Equatable {
  final String id;
  final String title;
  final String handle;
  final List<Product> products;
  final bool selected;

  const Collection({
    required this.id,
    required this.title,
    required this.handle,
    this.products = const [],
    this.selected = false,
  });

  factory Collection.empty() {
    return const Collection(
      id: '',
      title: '',
      handle: '',
      products: [],
      selected: false,
    );
  }

  Collection copyWith({
    String? id,
    String? title,
    String? handle,
    List<Product>? products,
    bool? selected,
  }) {
    return Collection(
      id: id ?? this.id,
      title: title ?? this.title,
      handle: handle ?? this.handle,
      products: products ?? this.products,
      selected: selected ?? this.selected,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        handle,
        products,
        selected,
      ];
}
