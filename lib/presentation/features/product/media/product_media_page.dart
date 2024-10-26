import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/domain/models/medusa_file.dart';
import 'package:zentrio_admin/presentation/components/dialog_footer.dart';
import 'package:zentrio_admin/presentation/components/dialog_header.dart';
import 'package:zentrio_admin/presentation/features/product/media/gallery/product_gallery.dart';
import 'package:zentrio_admin/presentation/features/product/media/product_media_view_model.dart';
import 'package:zentrio_admin/utils/extensions/localization_ext.dart';
import 'package:zentrio_admin/utils/extensions/miscellaneous_ext.dart';

import '../../../../di/init.dart';
import 'edit/product_gallery_edit.dart';

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
    return Column(
      children: [
        DialogHeader(
          onTap: () => GoRouter.of(context).pop(),
          trailing: viewModel.viewMode.watch(context) == ViewMode.edit
              ? ShadButton(
                  size: ShadButtonSize.sm,
                  child: Text(context.loc.gallery),
                  onPressed: () {
                    if (viewModel.hasNewMedia()) {
                      showShadDialog(
                        context: context,
                        builder: (context) => ShadDialog.alert(
                          title: Text(context.loc.leaveFormConfirmationTitle),
                          description: Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text(
                                context.loc.leaveFormConfirmationDescription),
                          ),
                          actions: [
                            ShadButton.outline(
                              size: ShadButtonSize.sm,
                              child: Text(context.loc.cancel),
                              onPressed: () => GoRouter.of(context).pop(false),
                            ),
                            const SizedBox(width: 8),
                            ShadButton.destructive(
                              size: ShadButtonSize.sm,
                              child: Text(context.loc.continueLabel),
                              onPressed: ()  {
                                viewModel.clearUnsavedMedia();
                                GoRouter.of(context).pop();
                                viewModel.viewMode.set(ViewMode.gallery);
                              },
                            ),
                          ],
                        ),
                      );
                      return;
                    }
                    viewModel.viewMode.set(ViewMode.gallery);
                  },
                )
              : _GalleryTrailing(
                  productId: widget.productId,
                  onEdit: () => viewModel.viewMode.set(ViewMode.edit),
                ),
        ),
        Expanded(
          child: Watch(
            (_) {
              if (viewModel.medias.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }
              return viewModel.viewMode.value == ViewMode.gallery
                  ? ProductGallery(files: viewModel.medias.value)
                  : ProductGalleryEdit(
                      files: viewModel.medias.value,
                      onFilesSelected: viewModel.onFileSelected,
                    );
            },
          ),
        ),
        const Divider(height: 1),
        if (viewModel.viewMode.watch(context) == ViewMode.gallery)
          _ProductMediaFooter(
            files: viewModel.medias.watch(context),
            onMediaSelected: viewModel.onMediaSelected,
            onNextSelected: viewModel.onNextSelected,
            onPreviousSelected: viewModel.onPreviousSelected,
          )
        else
          DialogFooter(
            onCancel: () => GoRouter.of(context).pop(),
            onCreate: () {},
          )
      ],
    );
  }
}

class _GalleryTrailing extends StatelessWidget {
  final String productId;
  final VoidCallback onEdit;

  const _GalleryTrailing({
    required this.productId,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ShadButton.outline(
          icon: const Icon(
            LucideIcons.trash2,
            size: 16,
          ),
          onPressed: () {},
        ),
        ShadButton.outline(
          icon: const Icon(
            LucideIcons.download,
            size: 16,
          ),
          onPressed: () {},
        ),
        ShadButton(
          size: ShadButtonSize.sm,
          onPressed: onEdit,
          child: Text(context.loc.edit),
        )
      ].separatedBy(const SizedBox(width: 8)),
    );
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
