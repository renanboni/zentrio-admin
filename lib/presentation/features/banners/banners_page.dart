import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/di/init.dart';
import 'package:flutter/material.dart' hide Banner;
import 'package:zentrio_admin/presentation/features/banners/banners_view_model.dart';
import 'package:zentrio_admin/presentation/features/banners/components/banner_table.dart';

class BannersPage extends StatefulWidget {
  const BannersPage({super.key});

  @override
  State<BannersPage> createState() => _BannersPageState();
}

class _BannersPageState extends State<BannersPage> {
  final BannersViewModel viewModel = getIt<BannersViewModel>();

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      padding: const EdgeInsets.all(0),
      title: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Banners",
              style: ShadTheme.of(context).textTheme.table,
            ),
            ShadButton(
              child: const Text('Create'),
              onPressed: () {
                GoRouter.of(context).go("/banners/create");
              },
            )
          ],
        ),
      ),
      child: Expanded(
        child: Column(
          children: [
            const Divider(height: 1),
            Expanded(
              child: BannerTable(
                banners: viewModel.banners.watch(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
