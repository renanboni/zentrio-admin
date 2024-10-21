import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/domain/models/product_type.dart';
import 'package:zentrio_admin/presentation/components/sheet_footer.dart';
import 'package:zentrio_admin/presentation/components/sheet_header.dart';
import 'package:zentrio_admin/utils/extensions/sizes_ext.dart';

import '../../../../di/init.dart';
import 'edit_product_type_view_model.dart';

class EditProductTypePage extends StatefulWidget {
  final ProductType productType;

  const EditProductTypePage({
    super.key,
    required this.productType,
  });

  @override
  State<EditProductTypePage> createState() => _EditProductTypePageState();
}

class _EditProductTypePageState extends State<EditProductTypePage> {
  final EditProductTypeViewModel viewModel = getIt<EditProductTypeViewModel>();

  @override
  void initState() {
    viewModel.init(widget.productType.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SheetHeader(
            title: "Edit Product Type",
            onTap: () => GoRouter.of(context).pop(),
          ),
          Expanded(
            child: Padding(
              padding: 16.paddingAll(),
              child: ShadInputFormField(
                label: const Text("Value"),
                initialValue: widget.productType.value,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                //onChanged: viewModel.value.set,
              ),
            ),
          ),
          SheetFooter(
            onSave: () {},
            onCancel: () => GoRouter.of(context).pop(),
          )
        ],
      ),
    );
  }
}
