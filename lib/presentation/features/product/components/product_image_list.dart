import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../domain/models/medusa_file.dart';

const double _kImageWidth = 128;

class ProductImageList extends StatelessWidget {
  final List<MedusaFile> images;
  final Function(MedusaFile) onImageTap;

  const ProductImageList({
    super.key,
    required this.images,
    required this.onImageTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: _kImageWidth,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: images.length,
          separatorBuilder: (_, __) => const SizedBox(width: 8),
          itemBuilder: (_, index) {
            final image = images[index];
            return InkWell(
              onTap: () => onImageTap(image),
              child: ProductImageItemList(image: image),
            );
          },
        ),
      ),
    );
  }
}

class ProductImageItemList extends StatelessWidget {
  final MedusaFile image;

  const ProductImageItemList({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: ShadImage(
        width: _kImageWidth,
        height: _kImageWidth,
        image.url,
        fit: BoxFit.cover,
      ),
    );
  }
}
