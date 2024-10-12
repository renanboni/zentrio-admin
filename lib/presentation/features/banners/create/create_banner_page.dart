import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/di/init.dart';
import 'package:zentrio_admin/domain/models/media_file.dart';
import 'package:zentrio_admin/presentation/components/dialog_footer.dart';
import 'package:zentrio_admin/presentation/components/dialog_header.dart';
import 'package:zentrio_admin/presentation/components/image_picker.dart';
import 'package:zentrio_admin/presentation/components/optional_label.dart';
import 'package:zentrio_admin/presentation/features/banners/create/create_banner_view_model.dart';
import 'package:zentrio_admin/utils/extensions/context_ext.dart';
import 'package:zentrio_admin/utils/extensions/miscellaneous_ext.dart';
import 'package:zentrio_admin/utils/extensions/sizes_ext.dart';

import '../../../components/switch_card.dart';
import '../../products/create/components/media_item_list.dart';

class CreateBannerPage extends StatefulWidget {
  const CreateBannerPage({
    super.key,
  });

  @override
  State<CreateBannerPage> createState() => _CreateBannerPageState();
}

class _CreateBannerPageState extends State<CreateBannerPage> {
  final CreateBannerViewModel viewModel = getIt<CreateBannerViewModel>();
  DropzoneViewController? controller;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Column(
      children: [
        DialogHeader(onTap: () => GoRouter.of(context).pop()),
        Expanded(
          child: MaxWidthBox(
            maxWidth: context.maxWidth,
            child: Padding(
              padding: 16.paddingAll(),
              child: SingleChildScrollView(
                child: ResponsiveRowColumn(
                  layout: ResponsiveRowColumnType.COLUMN,
                  columnCrossAxisAlignment: CrossAxisAlignment.start,
                  rowSpacing: 16,
                  columnSpacing: 16,
                  children: [
                    ResponsiveRowColumnItem(
                      child: Text(
                        "Banner",
                        style: theme.textTheme.large,
                      ),
                    ),
                    ResponsiveRowColumnItem(
                      child: ResponsiveRowColumn(
                        rowSpacing: 12,
                        columnSpacing: 8,
                        rowCrossAxisAlignment: CrossAxisAlignment.start,
                        layout: ResponsiveBreakpoints.of(context)
                                .smallerThan(DESKTOP)
                            ? ResponsiveRowColumnType.COLUMN
                            : ResponsiveRowColumnType.ROW,
                        children: [
                          ResponsiveRowColumnItem(
                            rowFlex: 1,
                            child: ShadInputFormField(
                              label: const Text('CTA'),
                              onChanged: viewModel.cta.set,
                            ),
                          ),
                          ResponsiveRowColumnItem(
                            rowFlex: 1,
                            child: ShadInputFormField(
                              label: const Text('CTA Link'),
                              onChanged: viewModel.ctaLink.set,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ResponsiveRowColumnItem(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Image",
                            style: theme.textTheme.small,
                          ),
                          ImagePicker(
                            onFilesSelected: (images) {
                              viewModel.onAddImages(images);
                            },
                            onControllerCreated: (controller) {
                              this.controller = controller;
                            },
                          ),
                          if (viewModel.image.watch(context).isNotEmpty)
                            ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: viewModel.image.length,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 8),
                              itemBuilder: (context, index) {
                                final file = viewModel.image[index];

                                return MediaItemList(
                                  mediaFile: file,
                                  thumbnailWidth: 80,
                                  thumbnailHeight: 40,
                                  onDelete: () async {
                                    await controller!.releaseFileUrl(file.url);
                                    viewModel.onDeleteImage(index);
                                  },
                                );
                              },
                            ),
                        ].separatedBy(const SizedBox(height: 8)),
                      ),
                    ),
                    const ResponsiveRowColumnItem(
                      child: SizedBox(height: 12),
                    ),
                    ResponsiveRowColumnItem(
                      child: Column(
                        children: [
                          const OptionalLabel(label: "Mobile Image"),
                          ImagePicker(onFilesSelected: (images) {
                            viewModel.onAddMobileImages(images);
                          }),
                          if (viewModel.mobileImage.watch(context).isNotEmpty)
                            ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: viewModel.mobileImage.length,
                              separatorBuilder: (context, index) =>
                              const SizedBox(height: 8),
                              itemBuilder: (context, index) {
                                final file = viewModel.mobileImage[index];

                                return MediaItemList(
                                  mediaFile: file,
                                  thumbnailWidth: 80,
                                  thumbnailHeight: 40,
                                  onDelete: () async {
                                    await controller!.releaseFileUrl(file.url);
                                    viewModel.onDeleteMobileImage(index);
                                  },
                                );
                              },
                            )
                        ].separatedBy(const SizedBox(height: 8)),
                      ),
                    ),
                    ResponsiveRowColumnItem(
                      child: SwitchCard(
                        title: "Enabled",
                        description:
                            "If enabled, the banner will be displayed on the website",
                        value: viewModel.enabled.watch(context),
                        onChanged: viewModel.enabled.set,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        DialogFooter(
          onCancel: () => GoRouter.of(context).pop(),
          onCreate: () {
            if (viewModel.image.isEmpty) {
              context.error("Please select an image");
              return;
            }

            viewModel.onSave(
              () {
                context.success("Banner created successfully");
                GoRouter.of(context).pop(true);
              },
              () {
                context.error("Failed to create banner");
              },
            );
          },
        )
      ],
    );
  }
}
