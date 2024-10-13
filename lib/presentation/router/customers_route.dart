
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../features/customers/customers_page.dart';

final customerRoute = GoRoute(
  path: "/customers",
  builder: (BuildContext context, GoRouterState state) {
    return const CustomersPage();
  },
);
