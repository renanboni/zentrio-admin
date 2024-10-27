import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/utils/extensions/sizes_ext.dart';

class RadioItemList extends StatelessWidget {
  final String title;
  final String? description;
  final bool value;
  final VoidCallback onTap;

  const RadioItemList({
    super.key,
    required this.title,
    this.description,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final effectiveSize = theme.radioTheme.size ?? 16;
    final effectiveCircleSize = theme.radioTheme.circleSize ?? 10;
    final effectiveColor = theme.colorScheme.primary;

    return InkWell(
      onTap: onTap,
      child: ShadCard(
        padding: 12.paddingAll(),
        border: value ? Border.all(
          color: theme.colorScheme.ring,
          width: 1,
        ) : null,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: effectiveSize,
              height: effectiveSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: effectiveColor,
                  width: 2,
                ),
              ),
              child: value
                  ? Center(
                      child: Container(
                        width: effectiveCircleSize,
                        height: effectiveCircleSize,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: effectiveColor,
                        ),
                      ),
                    )
                  : null,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.small,
                    ),
                    if (description != null) const SizedBox(height: 4),
                    Text(
                      description!,
                      style: theme.textTheme.muted,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
