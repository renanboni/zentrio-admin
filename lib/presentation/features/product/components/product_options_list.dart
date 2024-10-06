import 'package:flutter/cupertino.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/domain/models/product_option.dart';
import 'package:zentrio_admin/presentation/components/edit_context_menu.dart';
import 'package:zentrio_admin/utils/extensions/miscellaneous_ext.dart';

class ProductOptionsList extends StatelessWidget {
  final List<ProductOption> options;
  final Function(ProductOption) onDelete;

  const ProductOptionsList({
    super.key,
    required this.options,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: options.length,
      itemBuilder: (context, index) {
        return _ProductOptionItemList(
          option: options[index],
          onDelete: () => onDelete(options[index]),
        );
      },
    );
  }
}

class _ProductOptionItemList extends StatelessWidget {
  final ProductOption option;
  final VoidCallback onDelete;

  const _ProductOptionItemList({
    required this.option,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Row(
      children: [
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            option.title,
            style: theme.textTheme.muted,
          ),
        ),
        Expanded(child: _buildOptionValues(option.values)),
        EditContextMenu(
          onEdit: () {},
          onDelete: () => onDelete(),
          deleteDialogTitle: "Are you sure?",
          deleteDialogDescription:
              "You are about to delete the product option: ${option.title}. This action cannot be undone.",
        ),
        const SizedBox(width: 16),
      ],
    );
  }

  _buildOptionValues(
    List<String> values,
  ) {
    return Row(
      children: values
          .map(
            (value) => ShadBadge.secondary(
              child: Text(
                value,
              ),
            ),
          )
          .toList()
          .separatedBy(const SizedBox(width: 8)),
    );
  }
}
