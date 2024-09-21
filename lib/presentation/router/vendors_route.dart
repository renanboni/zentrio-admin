import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../di/init.dart';
import '../components/dialog_page.dart';
import '../features/dashboard/vendor/vendors_controller.dart';
import '../features/dashboard/vendor/vendors_page.dart';
import '../features/invite/vendor_invite_page.dart';
import 'app_router.dart';

final vendorsRoute = GoRoute(
  path: "/vendors",
  builder: (BuildContext context, GoRouterState state) {
    return VendorsPage(
      controller: getIt<VendorsController>(),
    );
  },
  routes: [
    GoRoute(
      path: "create",
      parentNavigatorKey: rootNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return DialogPage(builder: (_) => const VendorInvitePage());
      },
    ),
  ],
);
