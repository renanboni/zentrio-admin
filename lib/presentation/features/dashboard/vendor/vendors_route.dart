import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'vendors_page.dart';

class VendorsRouteData extends GoRouteData {
  const VendorsRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const VendorsPage();
  }
}
