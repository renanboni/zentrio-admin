import 'package:flutter/material.dart' hide Banner;
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/presentation/components/edit_context_menu.dart';
import '../../../../domain/models/Banner.dart';

class BannerTable extends StatelessWidget {
  final List<Banner> banners;

  const BannerTable({
    super.key,
    required this.banners,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: banners.length,
      itemBuilder: (context, index) {
        return _BannerItemList(banner: banners[index]);
      },
      separatorBuilder: (context, index) {
        return const Divider(height: 1);
      },
    );
  }
}

class _BannerItemList extends StatelessWidget {
  final Banner banner;

  const _BannerItemList({
    required this.banner,
  });

  @override
  Widget build(BuildContext context) {
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
        const SizedBox(width: 16),
        SizedBox(width: 100, child: Text(banner.ctaText)),
        SizedBox(width: 100, child: banner.enabled ? const Text('Enabled') : const Text('Disabled')),
        const Spacer(),
        EditContextMenu(onEdit: () {}),
        const SizedBox(width: 16)
      ],
    );
  }
}
