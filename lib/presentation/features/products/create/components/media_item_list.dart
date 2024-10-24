import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/domain/models/media_file.dart';

class MediaItemList extends StatelessWidget {
  final MediaFile mediaFile;
  final VoidCallback onDelete;
  final VoidCallback? onMakeThumbnail;
  final double thumbnailWidth;
  final double thumbnailHeight;

  const MediaItemList({
    super.key,
    required this.mediaFile,
    required this.onDelete,
    this.thumbnailWidth = 32,
    this.thumbnailHeight = 36,
    this.onMakeThumbnail,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final ShadContextMenuController controller = ShadContextMenuController();

    return ShadCard(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              mediaFile.url,
              width: thumbnailWidth,
              height: thumbnailHeight,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mediaFile.name,
                  style: theme.textTheme.small,
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    if (mediaFile.isThumbnail)
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(36),
                        ),
                        child: const ShadImage.square(
                          LucideIcons.galleryHorizontalEnd,
                          size: 8,
                          color: Colors.white,
                        ),
                      ),
                    if (mediaFile.isThumbnail) const SizedBox(width: 4),
                    Text(
                      mediaFile.sizeFormatted,
                      style: theme.textTheme.muted,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              ShadContextMenu(
                controller: controller,
                visible: controller.isOpen,
                items: [
                  if (onMakeThumbnail != null)
                    ShadContextMenuItem(
                      onPressed: onMakeThumbnail,
                      leading: const ShadImage.square(
                        LucideIcons.galleryHorizontalEnd,
                        size: 16,
                      ),
                      child: Text(
                        "Make thumbnail",
                        style: theme.textTheme.muted,
                      ),
                    ),
                  if (onMakeThumbnail != null)
                  const Divider(height: 8),
                  ShadContextMenuItem(
                    onPressed: onDelete,
                    leading: const ShadImage.square(
                      LucideIcons.trash,
                      size: 16,
                    ),
                    child: Text(
                      "Delete",
                      style: theme.textTheme.muted,
                    ),
                  ),
                ],
                child: IconButton(
                  icon: const Icon(LucideIcons.ellipsis),
                  onPressed: () {
                    controller.toggle();
                  },
                ),
              ),
              IconButton(
                iconSize: 16,
                icon: const Icon(LucideIcons.x),
                onPressed: onDelete,
              ),
            ],
          )
        ],
      ),
    );
  }
}
