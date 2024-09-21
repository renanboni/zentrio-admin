import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:tuple/tuple.dart';
import 'package:zentrio_admin/domain/models/product.dart';

import '../../../components/key_value_item_list.dart';

class ProductDetailsCard extends StatelessWidget {
  final Product product;

  const ProductDetailsCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          _buildHeader(context, product),
          const Divider(height: 1),
          KeyValueItemList(pair: Tuple2("Description", product.description)),
          const Divider(height: 1),
          KeyValueItemList(pair: Tuple2("Subtitle", product.subtitle)),
          const Divider(height: 1),
          KeyValueItemList(pair: Tuple2("Handle", product.handle)),
          const Divider(height: 1),
          KeyValueItemList(pair: Tuple2("Discountable", product.discountable)),
        ],
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context,
    Product product,
  ) {
    final theme = ShadTheme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(
        children: [
          Text(
            product.title,
            style: theme.textTheme.table,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
