
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../components/dialog_page.dart';
import '../features/campaigns/campaigns_page.dart';
import '../features/campaigns/create/create_campaign_page.dart';
import '../features/promotions/promotions_page.dart';
import 'app_router.dart';

final campaignsRoute = GoRoute(
  path: "/campaigns",
  builder: (BuildContext context, GoRouterState state) {
    return const CampaignsPage();
  },
  routes: [
    GoRoute(
      path: "create",
      parentNavigatorKey: rootNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return DialogPage(
          builder: (_) => const CreateCampaignPage(),
        );
      },
    ),
  ]
);