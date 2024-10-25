import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/di/init.dart';
import 'package:zentrio_admin/presentation/features/category/components/products_card.dart';
import 'package:zentrio_admin/presentation/features/collection/collection_view_model.dart';
import 'package:zentrio_admin/presentation/features/collection/components/collection_detail_card.dart';
import 'package:zentrio_admin/utils/extensions/miscellaneous_ext.dart';

class CollectionPage extends StatefulWidget {
  final String collectionId;

  const CollectionPage({
    super.key,
    required this.collectionId,
  });

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  final CollectionViewModel _viewModel = getIt<CollectionViewModel>();

  @override
  void initState() {
    _viewModel.init(widget.collectionId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CollectionDetailCard(
          collection: _viewModel.collection.watch(context),
          onRefresh: () {},
        ),
        Expanded(
          child: ProductsCard(
            products: _viewModel.collection.watch(context).products,
          ),
        ),
      ].separatedBy(const SizedBox(height: 16)),
    );
  }
}
