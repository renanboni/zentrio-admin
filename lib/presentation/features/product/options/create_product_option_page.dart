import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/di/init.dart';
import 'package:zentrio_admin/presentation/features/product/options/create_product_option_view_model.dart';
import 'package:zentrio_admin/utils/extensions/context_ext.dart';

import '../../../components/inputChip/chips_input.dart';
import '../../../components/inputChip/input_chip.dart';
import '../../../components/sheet_footer.dart';
import '../../../components/sheet_header.dart';

class CreateProductOptionPage extends StatefulWidget {
  final String productId;

  const CreateProductOptionPage({
    super.key,
    required this.productId,
  });

  @override
  State<CreateProductOptionPage> createState() =>
      _CreateProductOptionPageState();
}

class _CreateProductOptionPageState extends State<CreateProductOptionPage> {
  final CreateProductOptionViewModel _viewModel =
      getIt<CreateProductOptionViewModel>();

  @override
  void initState() {
    _viewModel.init(widget.productId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Expanded(
      child: Column(
        children: [
          SheetHeader(
            title: "Create Option",
            onTap: () => GoRouter.of(context).pop(),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShadInputFormField(
                  label: const Text("Option title"),
                  placeholder: const Text("Color"),
                  onChanged: _viewModel.title.set,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                ),
                const SizedBox(height: 16),
                Text(
                  "Variations (comma-separated)",
                  style: theme.textTheme.small,
                ),
                const SizedBox(height: 8),
                ChipsInput(
                  placeholder: "Red, Green, Blue",
                  values: _viewModel.variations.watch(context),
                  onChanged: _viewModel.variations.set,
                  onTextChanged: (value) {
                    if (value.contains(",")) {
                      _viewModel.variations.add(value.replaceAll(",", ""));
                    }
                  },
                  onSubmitted: (value) {
                    _viewModel.variations.add(value);
                  },
                  chipBuilder: (context, data) {
                    return TextInputChip(
                      label: data,
                      onDeleted: (value) {
                        _viewModel.variations.remove(value);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          const Spacer(),
          SheetFooter(
            onSave: () async {
              _viewModel.onSave(
                () {
                  context.success("Option created successfully");
                  GoRouter.of(context).pop(true);
                },
                () => context.error("Failed to create option"),
              );
            },
            onCancel: () => GoRouter.of(context).pop(false),
          ),
        ],
      ),
    );
  }
}
