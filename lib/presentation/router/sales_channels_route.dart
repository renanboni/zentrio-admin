
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../features/customers/customers_page.dart';
import '../features/salesChannels/sales_channels_page.dart';

final salesChannelsRoute = GoRoute(
  path: "/sales_channels",
  builder: (BuildContext context, GoRouterState state) {
    return const SalesChannelsPage();
  },
);
