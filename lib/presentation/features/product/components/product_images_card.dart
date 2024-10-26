import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/domain/models/medusa_file.dart';
import 'package:zentrio_admin/presentation/features/product/components/product_image_list.dart';

import '../../../components/edit_context_menu.dart';

class ProductImagesCard extends StatelessWidget {
  final List<MedusaFile> images;
  final Function(MedusaFile) onImageTap;

  const ProductImagesCard({
    super.key,
    required this.images,
    required this.onImageTap,
  });

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          _buildHeader(context),
          const Divider(height: 1),
          ProductImageList(
            images: images,
            onImageTap: onImageTap,
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(
        children: [
          Text(
            "Media",
            style: theme.textTheme.table,
          ),
          const Spacer(),
          EditContextMenu(
            onEdit: () async {},
          )
        ],
      ),
    );
  }
}
