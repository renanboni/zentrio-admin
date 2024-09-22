import 'package:zentrio_admin/data/mappers/file_mapper.dart';
import 'package:zentrio_admin/data/models/req/create_category_req.dart';
import 'package:zentrio_admin/domain/models/product_option.dart';

import '../../domain/models/category.dart';
import '../../domain/models/product.dart';
import '../models/api_category.dart';
import '../models/api_product.dart';
import '../models/api_product_option.dart';

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
      width: width ?? '',
      weight: weight ?? '',
      height: height ?? '',
      length: length ?? '',
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
      options: options?.map((e) => e.toProductOption()).toList() ?? [],
      images: images?.map((e) => e.toMediaFile()).toList() ?? [],
    );
  }
}

extension ProductMapper on Product {
  ApiProduct createProductRequest() {
    return ApiProduct(
      title: title,
      handle: handle,
      description: description,
      subtitle: subtitle,
      isGiftcard: isGiftcard,
      status: status,
      thumbnail: thumbnail,
      weight: weight,
      height: height,
      length: length,
      originCountry: originCountry,
      hsCode: hsCode,
      midCode: midCode,
      material: material,
      typeId: typeId,
      discountable: discountable,
      externalId: externalId,
      options: options
          .map((e) => ApiProductOption(title: title, values: e.values))
          .toList(),
    );
  }
}

extension ApiProductOptionMapper on ApiProductOption {
  ProductOption toProductOption() {
    return ProductOption(
      title: title ?? '',
      values: values ?? [],
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

extension CategoryMapper on Category {
  CreateCategoryRequest createCategoryRequest() {
    return CreateCategoryRequest(
      name: name,
      handle: handle,
      description: description,
      isActive: isActive,
      isInternal: isInternal,
      rank: rank,
    );
  }
}
