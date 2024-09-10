import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class MediaListDropzonePlaceholder extends StatelessWidget {
  const MediaListDropzonePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                size: 16,
                LucideIcons.upload,
                color: theme.colorScheme.mutedForeground,
              ),
              const SizedBox(width: 8),
              Text(
                "Upload images",
                style: theme.textTheme.muted,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'Drag and drop images here or click to upload',
            style: theme.textTheme.muted,
          ),
        ],
      ),
    );
  }
}
