import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/domain/models/product_tag.dart';
import 'package:zentrio_admin/presentation/components/sheet_footer.dart';
import 'package:zentrio_admin/presentation/components/sheet_header.dart';
import 'package:zentrio_admin/utils/extensions/sizes_ext.dart';

import '../../../../di/init.dart';
import 'edit_product_tag_view_model.dart';

class EditProductTagPage extends StatefulWidget {
  final ProductTag productTag;

  const EditProductTagPage({
    super.key,
    required this.productTag,
  });

  @override
  State<EditProductTagPage> createState() => _EditProductTagPageState();
}

class _EditProductTagPageState extends State<EditProductTagPage> {
  final EditProductTagViewModel viewModel = getIt<EditProductTagViewModel>();

  @override
  void initState() {
    viewModel.init(widget.productTag.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SheetHeader(
            title: "Edit Product Tag",
            onTap: () => GoRouter.of(context).pop(),
          ),
          Expanded(
            child: Padding(
              padding: 16.paddingAll(),
              child: ShadInputFormField(
                label: const Text("Value"),
                initialValue: widget.productTag.value,
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
