import 'package:flutter/cupertino.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/domain/models/product_option.dart';
import 'package:zentrio_admin/presentation/components/edit_context_menu.dart';
import 'package:zentrio_admin/presentation/features/collection/collection_page.dart';
import 'package:zentrio_admin/utils/extensions/miscellaneous_ext.dart';

class ProductOptionsList extends StatelessWidget {
  final List<ProductOption> options;

  const ProductOptionsList({
    super.key,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: options.length,
      itemBuilder: (context, index) {
        return _ProductOptionItemList(option: options[index]);
      },
    );
  }
}

class _ProductOptionItemList extends StatelessWidget {
  final ProductOption option;

  const _ProductOptionItemList({
    required this.option,
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
        EditContextMenu(onEdit: () {}),
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
            .separatedBy(
              const SizedBox(width: 8),
            ));
  }
}
