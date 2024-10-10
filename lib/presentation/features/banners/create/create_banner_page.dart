import 'package:flutter/material.dart';
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
                        layout:
                        ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
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
                          ImagePicker(onFilesSelected: (images) {
                            viewModel.onImageChanged(images.first);
                          }),
                          if (viewModel.image.watch(context) != MediaFile.empty())
                            MediaItemList(
                              mediaFile: viewModel.image.watch(context),
                              onDelete: () async {},
                            )
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
                            viewModel.onMobileImageChanged(images.first);
                          }),
                          if (viewModel.mobileImage.watch(context) !=
                              MediaFile.empty())
                            MediaItemList(
                              mediaFile: viewModel.mobileImage.watch(context),
                              onDelete: () async {},
                            )
                        ].separatedBy(const SizedBox(height: 8)),
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
            if (viewModel.image.value == MediaFile.empty()) {
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
