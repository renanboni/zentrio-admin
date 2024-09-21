import 'package:flutter/cupertino.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../domain/models/medusa_file.dart';

const double _kImageWidth = 128;

class ProductImageList extends StatelessWidget {
  final List<MedusaFile> images;

  const ProductImageList({
    super.key,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: _kImageWidth,
        child: ListView.builder(
          shrinkWrap: false,
          scrollDirection: Axis.horizontal,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return ProductImageItemList(
              image: images[index],
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
