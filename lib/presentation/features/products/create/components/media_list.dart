import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/domain/models/media_file.dart';
import 'package:zentrio_admin/presentation/features/products/create/create_product_viewmodel.dart';
import 'package:zentrio_admin/utils/extensions/string_ext.dart';

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
  final CreateProductViewModel viewModel;

  const MediaList({
    super.key,
    required this.viewModel,
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

                  for (final file in files) {
                    final name = await controller.getFilename(file);
                    final size = await controller.getFileSize(file);
                    final mimeType = await controller.getFileMIME(file);
                    final url = await controller.createFileUrl(file);

                    widget.viewModel.files.value = [
                      ..._getFiles().value,
                      MediaFile(
                        name,
                        size,
                        mimeType,
                        url,
                      ),
                    ];
                  }
                } catch (e) {}
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
                  Center(
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
                  ),
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
              itemCount: _getFiles().watch(context).length,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final file = _getFiles().watch(context)[index];

                return MediaItemList(
                  mediaFile: file,
                  onDelete: () {
                    _updateFiles(List.from(_getFiles().value)..removeAt(index));
                  },
                  onMakeThumbnail: () {
                    widget.viewModel.files.value =
                        _getFiles().value.asMap().entries.map(
                      (entry) {
                        final i = entry.key;
                        final e = entry.value;

                        return e.copyWith(
                          isThumbnail: i == index,
                        ); // Update to false for other indices
                      },
                    ).toList();
                  },
                );
              },
            ),
          ],
        )
      ],
    );
  }

  Signal<List<MediaFile>> _getFiles() {
    return widget.viewModel.files;
  }

  _updateFiles(List<MediaFile> files) {
    widget.viewModel.files.value = files;
  }

  @override
  void dispose() {
    for (final file in widget.viewModel.files.value) {
      controller.releaseFileUrl(file.url);
    }
    super.dispose();
  }
}
