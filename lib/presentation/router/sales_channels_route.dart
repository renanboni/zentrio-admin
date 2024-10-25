
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../components/dialog_page.dart';
import '../features/salesChannels/create/create_sales_channel_page.dart';
import '../features/salesChannels/sales_channels_page.dart';
import 'app_router.dart';

final salesChannelsRoute = GoRoute(
  path: "/sales-channels",
  builder: (BuildContext context, GoRouterState state) {
    return const SalesChannelsPage();
  },
  routes: [
    GoRoute(
      path: "create",
      parentNavigatorKey: rootNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return DialogPage(
          builder: (_) => const CreateSalesChannelPage(),
        );
      },
    ),
  ]
);
