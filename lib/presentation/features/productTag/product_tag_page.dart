import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/main.dart';
import 'package:zentrio_admin/presentation/components/action_item_list.dart';
import 'package:zentrio_admin/presentation/components/empty_list_placeholder.dart';
import 'package:zentrio_admin/presentation/features/productTag/product_tag_view_model.dart';
import 'package:zentrio_admin/presentation/features/productType/product_type_view_model.dart';
import 'package:zentrio_admin/utils/extensions/miscellaneous_ext.dart';

import '../../../di/init.dart';
import '../../components/detail_card.dart';
import '../../components/edit_context_menu.dart';

class ProductTagPage extends StatefulWidget {
  final String productTagId;

  const ProductTagPage({
    super.key,
    required this.productTagId,
  });

  @override
  State<ProductTagPage> createState() => _ProductTagPageState();
}

class _ProductTagPageState extends State<ProductTagPage> {
  final ProductTagViewModel viewModel = getIt<ProductTagViewModel>();

  @override
  void initState() {
    viewModel.init(widget.productTagId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DetailCard(
          title: viewModel.productTag.watch(context).value,
          trailing: EditContextMenu(
            deleteDialogTitle: "Are you sure?",
            deleteDialogDescription:
                "You are about to delete the product type ${viewModel.productTag.value.value}. This action cannot be undone.",
            onEdit: () => {
              GoRouter.of(context).go(
                "/product_tags/${viewModel.productTag.value.id}/edit",
                extra: viewModel.productTag.value,
              ),
            },
            onDelete: () => {},
          ),
        ),
        const DetailCard(
          title: "Products",
          child: EmptyListPlaceholder(),
        ),
        ActionItemList(
          title: "Metadata",
          label: "${viewModel.productTag.watch(context).metadata.length} keys",
        )
      ].separatedBy(const SizedBox(height: 12)),
    );
  }
}
