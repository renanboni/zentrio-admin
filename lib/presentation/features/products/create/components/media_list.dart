import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/domain/models/media_file.dart';
import 'package:zentrio_admin/presentation/features/products/create/components/media_list_dropzone_placeholder.dart';

import 'media_item_list.dart';

const mime = [
  "image/jpeg",
  "image/png",
  "image/gif",
  "image/webp",
  "image/heic",
  "image/svg+xml"
];

class MediaList extends StatefulWidget {
  final List<MediaFile> files;
  final ValueChanged<List<MediaFile>> onFilesAdded;
  final ValueChanged<MediaFile> onMakeThumbnail;
  final ValueChanged<int> onDelete;

  const MediaList({
    super.key,
    required this.files,
    required this.onFilesAdded,
    required this.onMakeThumbnail,
    required this.onDelete,
  });

  @override
  State<MediaList> createState() => _MediaListState();
}

class _MediaListState extends State<MediaList> {
  late DropzoneViewController controller;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Column(
      children: [
        DottedBorder(
          borderType: BorderType.RRect,
          radius: const Radius.circular(8),
          color: theme.colorScheme.mutedForeground,
          child: SizedBox(
            width: double.infinity,
            height: 128,
            child: InkWell(
              onTap: () async {
                try {
                  final files = await controller.pickFiles(
                    multiple: true,
                    mime: mime,
                  );

                  final List<MediaFile> mediaFiles = [];

                  for (final file in files) {
                    final name = await controller.getFilename(file);
                    final size = await controller.getFileSize(file);
                    final mimeType = await controller.getFileMIME(file);
                    final url = await controller.createFileUrl(file);

                    mediaFiles.add(
                      MediaFile(
                        name,
                        size,
                        mimeType,
                        url,
                      ),
                    );
                  }

                  widget.onFilesAdded(mediaFiles);
                } catch (e) {
                  print(e);
                }
              },
              child: Stack(
                children: [
                  IgnorePointer(
                    child: DropzoneView(
                      mime: mime,
                      cursor: CursorType.grab,
                      onCreated: (ctrl) {
                        controller = ctrl;
                      },
                      onError: (error) {},
                      onDropInvalid: (event) async {},
                      onDrop: (event) async {},
                      onHover: () async {},
                    ),
                  ),
                  const MediaListDropzonePlaceholder(),
                ],
              ),
            ),
          ),
        ),
        Column(
          children: [
            const SizedBox(height: 8),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.files.length,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final file = widget.files[index];

                return MediaItemList(
                  mediaFile: file,
                  onDelete: () async {
                    await controller.releaseFileUrl(file.url);
                    widget.onDelete(index);
                  },
                  onMakeThumbnail: () => widget.onMakeThumbnail(file),
                );
              },
            ),
          ],
        )
      ],
    );
  }
}
