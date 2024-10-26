import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/domain/models/medusa_file.dart';
import 'package:zentrio_admin/presentation/components/dialog_header.dart';
import 'package:zentrio_admin/presentation/features/banners/banners_page.dart';
import 'package:zentrio_admin/presentation/features/product/media/product_media_view_model.dart';
import 'package:zentrio_admin/utils/extensions/context_ext.dart';
import 'package:zentrio_admin/utils/extensions/miscellaneous_ext.dart';

import '../../../../di/init.dart';

class ProductMediaPage extends StatefulWidget {
  final String productId;
  final String? selectedMediaId;

  const ProductMediaPage({
    super.key,
    required this.productId,
    this.selectedMediaId = '',
  });

  @override
  State<ProductMediaPage> createState() => _ProductMediaPageState();
}

class _ProductMediaPageState extends State<ProductMediaPage> {
  final ProductMediaViewModel viewModel = getIt<ProductMediaViewModel>();

  double? imageWidth;

  @override
  void initState() {
    viewModel.getMedias(
      widget.productId,
      widget.selectedMediaId ?? '',
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    imageWidth ??= _getWidth(context);

    return Column(
      children: [
        DialogHeader(onTap: () => GoRouter.of(context).pop()),
        Expanded(
          child: MaxWidthBox(
            maxWidth: imageWidth,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: ShadImage(
                  viewModel.medias
                          .watch(context)
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
          ),
        ),
        const Divider(height: 1),
        _ProductMediaFooter(
          files: viewModel.medias.watch(context),
          onMediaSelected: viewModel.onMediaSelected,
          onNextSelected: viewModel.onNextSelected,
          onPreviousSelected: viewModel.onPreviousSelected,
        ),
      ],
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

class _ProductMediaFooter extends StatelessWidget {
  final List<MedusaFile> files;
  final Function(MedusaFile) onMediaSelected;
  final VoidCallback onNextSelected;
  final VoidCallback onPreviousSelected;

  const _ProductMediaFooter({
    required this.files,
    required this.onMediaSelected,
    required this.onNextSelected,
    required this.onPreviousSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: onPreviousSelected,
            color: theme.colorScheme.ring,
            icon: const Icon(LucideIcons.chevronLeft),
          ),
          Row(
            children: [
              for (final file in files)
                InkWell(
                  onTap: () => onMediaSelected(file),
                  child: Container(
                    decoration: BoxDecoration(
                      border: file.selected
                          ? Border.all(
                              color: theme.colorScheme.ring,
                              width: 2, // Border width
                            )
                          : null,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: ShadImage(
                        file.url,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
            ].separatedBy(const SizedBox(width: 8)),
          ),
          IconButton(
            onPressed: onNextSelected,
            color: theme.colorScheme.ring,
            icon: const Icon(LucideIcons.chevronRight),
          ),
        ],
      ),
    );
  }
}
