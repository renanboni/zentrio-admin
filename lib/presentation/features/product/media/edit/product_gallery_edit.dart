import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/presentation/components/optional_label.dart';
import 'package:zentrio_admin/presentation/components/product_media.dart';
import 'package:zentrio_admin/utils/extensions/localization_ext.dart';

import '../../../../../domain/models/media_file.dart';
import '../../../../../domain/models/medusa_file.dart';
import '../../../../components/image_picker.dart';

class ProductGalleryEdit extends StatelessWidget {
  final List<MedusaFile> files;
  final ValueChanged<List<MediaFile>> onFilesSelected;
  final Function(MedusaFile file, bool isChecked) onMediaFileChecked;

  const ProductGalleryEdit({
    super.key,
    required this.files,
    required this.onFilesSelected,
    required this.onMediaFileChecked,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ResponsiveRowColumn(
      rowSpacing: 12,
      columnSpacing: 8,
      layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
          ? ResponsiveRowColumnType.COLUMN
          : ResponsiveRowColumnType.ROW,
      children: [
        ResponsiveRowColumnItem(
          rowFlex: 2,
          columnOrder: 2,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
            ),
            padding: const EdgeInsets.all(8.0),
            itemCount: files.length,
            itemBuilder: (context, index) {
              final file = files[index];
              return ProductMedia(
                file: file,
                onChecked: onMediaFileChecked,
              );
            },
          ),
        ),
        ResponsiveRowColumnItem(
          rowFlex: 1,
          columnOrder: 1,
          child: Expanded(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              color: theme.colorScheme.primaryForeground,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const OptionalLabel(label: "Media"),
                  Text(context.loc.addProductMediaDescription),
                  const SizedBox(height: 8),
                  ImagePicker(
                    onFilesSelected: onFilesSelected,
                    onControllerCreated: (controller) {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
