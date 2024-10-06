import 'package:zentrio_admin/data/mappers/collection_mapper.dart';
import 'package:zentrio_admin/data/mappers/file_mapper.dart';
import 'package:zentrio_admin/data/models/api_product_tag.dart';
import 'package:zentrio_admin/data/models/req/create_category_req.dart';
import 'package:zentrio_admin/domain/models/metadata.dart';
import 'package:zentrio_admin/domain/models/product_option.dart';
import 'package:zentrio_admin/domain/models/product_option_value.dart';
import 'package:zentrio_admin/domain/models/product_tag.dart';
import 'package:zentrio_admin/domain/models/product_type.dart';

import '../../domain/models/category.dart';
import '../../domain/models/collection.dart';
import '../../domain/models/product.dart';
import '../models/api_category.dart';
import '../models/api_product.dart';
import '../models/api_product_option.dart';
import '../models/api_product_type.dart';

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
      collection: collection?.toCollection() ?? Collection.empty(),
      type: type?.toProductType() ?? ProductType.empty(),
      tags: tags?.map((e) => e.toProductTag()).toList() ?? [],
      createdAt: DateTime.tryParse(createdAt ?? ''),
      updatedAt: DateTime.tryParse(updatedAt ?? ''),
      deletedAt: DateTime.tryParse(deletedAt ?? ''),
      options: options?.map((e) => e.toProductOption()).toList() ?? [],
      images: images?.map((e) => e.toMediaFile()).toList() ?? [],
      categories: categories.map((e) => e.toCategory()).toList(),
      metadata: metadata?.entries
              .map((e) => Metadata(key: e.key, value: e.value.toString()))
              .toList() ??
          [],
    );
  }
}

extension ApiProductOptionMapper on ApiProductOption {
  ProductOption toProductOption() {
    return ProductOption(
      id: id ?? '',
      title: title ?? '',
      values: values
              ?.map((e) =>
                  ProductOptionValue(id: e.id ?? '', value: e.value ?? ''))
              .toList() ??
          [],
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
      products: products?.map((e) => e.toProduct()).toList() ?? [],
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

extension ProductTagMapper on ApiProductTag {
  ProductTag toProductTag() {
    return ProductTag(
      id: id ?? '',
      value: value ?? '',
    );
  }
}

extension ProductTypeMapper on ApiProductType {
  ProductType toProductType() {
    return ProductType(
      id: id ?? '',
      value: value ?? '',
    );
  }
}
