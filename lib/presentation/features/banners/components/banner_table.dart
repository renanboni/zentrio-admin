import 'package:flutter/material.dart' hide Banner;
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/presentation/components/edit_context_menu.dart';
import '../../../../domain/models/Banner.dart';

class BannerTable extends StatelessWidget {
  final List<Banner> banners;
  final Function(Banner) onDelete;

  const BannerTable({
    super.key,
    required this.banners,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _BannerTableHeader(),
        const Divider(height: 1),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: banners.length,
          itemBuilder: (context, index) {
            return _BannerItemList(
              banner: banners[index],
              onDelete: () => onDelete(banners[index]),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(height: 1);
          },
        ),
      ],
    );
  }
}

class _BannerItemList extends StatelessWidget {
  final Banner banner;
  final VoidCallback onDelete;

  const _BannerItemList({
    required this.banner,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Row(
      children: [
        const SizedBox(width: 16),
        SizedBox(
          width: 80,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: ShadImage(
              banner.thumbnail,
              width: 80,
              height: 40,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        const SizedBox(width: 24),
        Icon(
          LucideIcons.gripVertical,
          size: 16,
          color: theme.colorScheme.ring,
        ),
        const SizedBox(width: 24),
        SizedBox(
          width: 120,
          child: Text(
            banner.ctaText,
            style: theme.tableTheme.cellStyle,
          ),
        ),
        SizedBox(
          width: 100,
          child: banner.enabled
              ? _buildEnableStatusIndicator()
              : const SizedBox.shrink(),
        ),
        const Spacer(),
        EditContextMenu(
          onEdit: () {},
          onDelete: onDelete,
          deleteDialogTitle: "Delete Banner",
          deleteDialogDescription:
              "Are you sure you want to delete this banner?",
        ),
        const SizedBox(width: 16)
      ],
    );
  }

  Widget _buildEnableStatusIndicator() {
    return Container(
      width: 8,
      height: 8,
      decoration: const BoxDecoration(
        color: Colors.green,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _BannerTableHeader extends StatelessWidget {
  const _BannerTableHeader();

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          const SizedBox(width: 16),
          const SizedBox(width: 80),
          const SizedBox(width: 24),
          const SizedBox(width: 40),
          SizedBox(
            width: 120,
            child: Text(
              'CTA Text',
              style: theme.tableTheme.cellHeaderStyle,
            ),
          ),
          SizedBox(
            width: 100,
            child: Center(
              child: Text(
                'Status',
                style: theme.tableTheme.cellHeaderStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
