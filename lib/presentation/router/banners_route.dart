
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:zentrio_admin/presentation/features/banners/banners_page.dart';

import '../components/dialog_page.dart';
import '../features/banners/create/create_banner_page.dart';
import 'app_router.dart';

final bannersRoute = GoRoute(
  path: "/banners",
  builder: (BuildContext context, GoRouterState state) {
    return const BannersPage();
  },
  routes:[
    GoRoute(
      path: "create",
      parentNavigatorKey: rootNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return DialogPage(
          builder: (_) => const CreateBannerPage(),
        );
      },
    ),
  ]
);