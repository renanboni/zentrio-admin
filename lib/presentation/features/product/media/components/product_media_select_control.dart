import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/domain/models/medusa_file.dart';
import 'package:zentrio_admin/utils/extensions/localization_ext.dart';
import 'package:zentrio_admin/utils/extensions/miscellaneous_ext.dart';

class ProductMediaSelectControl extends StatelessWidget {
  final Set<MedusaFile> files;
  final VoidCallback onDeleted;
  final VoidCallback onMakeThumbnail;

  const ProductMediaSelectControl({
    super.key,
    required this.files,
    required this.onDeleted,
    required this.onMakeThumbnail,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return IntrinsicWidth(
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.background,
          border: Border.all(
            color: theme.colorScheme.border,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        height: 40,
        child: Row(
          children: [
            const SizedBox(width: 12),
            Text(
              context.loc.selectedCount(files.length),
              style: theme.textTheme.muted,
            ),
            if (files.length == 1) const VerticalDivider(width: 1),
            if (files.length == 1)
              TextButton(
                onPressed: onMakeThumbnail,
                child: Text(
                  context.loc.makeThumbnail,
                  style: theme.textTheme.small,
                ),
              ),
            const VerticalDivider(width: 1),
            TextButton(
              onPressed: onDeleted,
              child: Text(
                context.loc.delete,
                style: theme.textTheme.small,
              ),
            ),
            const SizedBox(width: 12),
          ].separatedBy(const SizedBox(width: 8)),
        ),
      ),
    );
  }
}
