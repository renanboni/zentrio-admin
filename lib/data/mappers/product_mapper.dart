
import '../../domain/models/category.dart';
import '../../domain/models/product.dart';
import '../models/api_category.dart';
import '../models/api_product.dart';

extension ApiProductMapper on ApiProduct {
  Product toProduct() {
    return Product(
      id: id ?? '',
      title: title ?? '',
      handle: handle ?? '',
      description: description ?? '',
      subtitle: subtitle ?? '',
      isGiftcard: isGiftcard ?? false,
      status: status ?? '',
      thumbnail: thumbnail ?? '',
      weight: weight ?? 0,
      height: height ?? 0,
      length: length ?? 0,
      originCountry: originCountry ?? '',
      hsCode: hsCode ?? '',
      midCode: midCode ?? '',
      material: material ?? '',
      typeId: typeId ?? '',
      discountable: discountable ?? false,
      externalId: externalId ?? '',
      createdAt: DateTime.tryParse(createdAt ?? ''),
      updatedAt: DateTime.tryParse(updatedAt ?? ''),
      deletedAt: DateTime.tryParse(deletedAt ?? ''),
    );
  }
}

extension ApiCategoryMapper on ApiCategory {
  Category toCategory() {
    return Category(
      id: id ?? '',
      name: name ?? '',
      handle: handle ?? '',
      description: description ?? '',
      isActive: isActive ?? false,
      isInternal: isInternal ?? false,
      rank: rank ?? 0,
      createdAt: DateTime.tryParse(createdAt ?? ''),
      updatedAt: DateTime.tryParse(updatedAt ?? ''),
      deletedAt: DateTime.tryParse(deletedAt ?? ''),
    );
  }
}