import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/di/init.dart';
import 'package:zentrio_admin/presentation/features/product/metadata/components/metadata_list.dart';
import 'package:zentrio_admin/presentation/features/product/metadata/product_metadata_view_model.dart';
import 'package:zentrio_admin/utils/extensions/context_ext.dart';

import '../../../components/sheet_footer.dart';
import '../../../components/sheet_header.dart';

class ProductMetadataPage extends StatefulWidget {
  final String productId;

  const ProductMetadataPage({
    super.key,
    required this.productId,
  });

  @override
  State<ProductMetadataPage> createState() => _ProductMetadataPageState();
}

class _ProductMetadataPageState extends State<ProductMetadataPage> {
  final ProductMetadataViewModel _viewModel = getIt<ProductMetadataViewModel>();

  @override
  void initState() {
    _viewModel.init(widget.productId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SheetHeader(
            title: "Edit Metadata",
            onTap: () => GoRouter.of(context).pop(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 24,
            ),
            child: MetadataList(
              metadata: _viewModel.metadata.watch(context),
              onAddRowAbove: _viewModel.onAddRowAbove,
              onAddRowBelow: _viewModel.onAddRowBelow,
              onDeleteRow: _viewModel.onDeleteRow,
              onKeyChanged: _viewModel.onKeyChanged,
              onValueChanged: _viewModel.onValueChanged,
            ),
          ),
          const Spacer(),
          SheetFooter(
            onSave: () async {
               _viewModel.onSave(
                () {
                  context.success("Metadata saved successfully");
                  GoRouter.of(context).pop(true);
                },
                () => context.error("Failed to save metadata"),
              );
            },
            onCancel: () => GoRouter.of(context).pop(false),
          ),
        ],
      ),
    );
  }
}
