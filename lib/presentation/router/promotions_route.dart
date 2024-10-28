
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../components/dialog_page.dart';
import '../features/promotions/create/create_promotion_page.dart';
import '../features/promotions/promotions_page.dart';
import 'app_router.dart';

final promotionsRoute = GoRoute(
  path: "/promotions",
  builder: (BuildContext context, GoRouterState state) {
    return const PromotionsPage();
  },
  routes: [
    GoRoute(
      path: "create",
      parentNavigatorKey: rootNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return DialogPage(
          builder: (_) => const CreatePromotionPage(),
        );
      },
    ),
  ]
);