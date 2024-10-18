import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/main.dart';
import 'package:zentrio_admin/presentation/components/action_item_list.dart';
import 'package:zentrio_admin/presentation/components/empty_list_placeholder.dart';
import 'package:zentrio_admin/presentation/features/productType/product_type_view_model.dart';
import 'package:zentrio_admin/utils/extensions/miscellaneous_ext.dart';

import '../../../di/init.dart';
import '../../components/detail_card.dart';
import '../../components/edit_context_menu.dart';

class ProductTypePage extends StatefulWidget {
  final String productTypeId;

  const ProductTypePage({
    super.key,
    required this.productTypeId,
  });

  @override
  State<ProductTypePage> createState() => _ProductTypePageState();
}

class _ProductTypePageState extends State<ProductTypePage> {
  final ProductTypeViewModel viewModel = getIt<ProductTypeViewModel>();

  @override
  void initState() {
    viewModel.init(widget.productTypeId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DetailCard(
          title: viewModel.productType.watch(context).value,
          trailing: EditContextMenu(
            deleteDialogTitle: "Are you sure?",
            deleteDialogDescription:
                "You are about to delete the product type ${viewModel.productType.value.value}. This action cannot be undone.",
            onEdit: () => {
              GoRouter.of(context).go(
                "/product_types/${viewModel.productType.value.id}/edit",
                extra: viewModel.productType.value,
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
          label: "${viewModel.productType.watch(context).metadata.length} keys",
        )
      ].separatedBy(const SizedBox(height: 12)),
    );
  }
}
