import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/domain/models/media_file.dart';

import '../features/products/create/components/media_list_dropzone_placeholder.dart';

const mime = [
  "image/jpeg",
  "image/png",
  "image/gif",
  "image/webp",
  "image/heic",
  "image/svg+xml"
];

class ImagePicker extends StatefulWidget {
  final ValueChanged<List<MediaFile>> onFilesSelected;
  final Function(DropzoneViewController)? onControllerCreated;

  const ImagePicker({
    super.key,
    required this.onFilesSelected,
    this.onControllerCreated,
  });

  @override
  State<ImagePicker> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  late DropzoneViewController controller;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(8),
      color: theme.colorScheme.border,
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
                final bytes = await controller.getFileData(file);

                mediaFiles.add(
                  MediaFile(
                    name,
                    size,
                    mimeType,
                    bytes,
                    url,
                  ),
                );
              }

              widget.onFilesSelected(mediaFiles);
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
                    widget.onControllerCreated?.call(controller);
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
    );
  }
}
