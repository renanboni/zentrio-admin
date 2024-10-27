
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../features/promotions/promotions_page.dart';

final promotionsRoute = GoRoute(
  path: "/promotions",
  builder: (BuildContext context, GoRouterState state) {
    return const PromotionsPage();
  },
);