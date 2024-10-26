import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../../domain/models/medusa_file.dart';

class ProductGallery extends StatefulWidget {
  final List<MedusaFile> files;

  const ProductGallery({
    super.key,
    required this.files,
  });

  @override
  State<ProductGallery> createState() => _ProductGalleryState();
}

class _ProductGalleryState extends State<ProductGallery> {
  double? imageWidth;

  @override
  Widget build(BuildContext context) {
    imageWidth ??= _getWidth(context);

    return MaxWidthBox(
      maxWidth: imageWidth,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: ShadImage(
            widget.files
                    .firstWhereOrNull(
                      (element) => element.selected,
                    )
                    ?.url ??
                '',
            fit: BoxFit.cover,
            height: double.infinity,
          ),
        ),
      ),
    );
  }

  double _getWidth(BuildContext context) {
    final breakpoints = ResponsiveBreakpoints.of(context);
    final screenWidth = MediaQuery.sizeOf(context).width;

    if (breakpoints.isTablet) {
      return screenWidth * 0.75;
    }

    return breakpoints.isMobile || breakpoints.isPhone
        ? screenWidth
        : screenWidth * 0.33;
  }
}
