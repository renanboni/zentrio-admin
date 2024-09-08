import 'package:flutter/cupertino.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/domain/models/product_option.dart';
import 'package:zentrio_admin/presentation/components/form_action_label.dart';
import 'package:zentrio_admin/presentation/features/products/create/product_option_list_item.dart';

class ProductOptions extends StatefulWidget {
  const ProductOptions({super.key});

  @override
  State<ProductOptions> createState() => _ProductOptionsState();
}

class _ProductOptionsState extends State<ProductOptions> {
  final _options = signal<List<ProductOption>>(
    [ProductOption.empty()],
  );

  late final _showAddOptionsAlert = computed(() {
    return _options.value.where((e) => e == ProductOption.empty()).length == _options.value.length;
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormActionLabel(
          title: "Product options",
          description:
              "Define the options for the product, e.g. color, size, etc.",
          cta: "Add",
          onPressed: () {
            _options.value = [
              ..._options.value,
              ProductOption.empty(),
            ];
          },
        ),
        const SizedBox(height: 16),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _options.watch(context).length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final option = _options.watch(context)[index];

            return ProductOptionListItem(
              enabled: index != 0,
              onRemove: () {
                _options.value = [
                  ..._options.value..removeAt(index),
                ];
              },
              onTitleChanged: (value) {
                _options.value = [
                  ..._options.value..replaceRange(index, index + 1, [option.copyWith(title: value)]),
                ];
              },
              onValuesChanged: (values) {
                _options.value = [
                  ..._options.value..replaceRange(index, index + 1, [option.copyWith(values: values)]),
                ];
              },
            );
          },
        ),
        const SizedBox(height: 16),
        const FormActionLabel(
          title: "Product variants",
          description:
              "This ranking will affect the variants' order in your storefront.",
        ),
        const SizedBox(height: 16),
        if (_showAddOptionsAlert.watch(context))
        const ShadAlert(
          iconSrc: LucideIcons.info,
          description: Text('Add options to create variants.'),
        ),
      ],
    );
  }
}
