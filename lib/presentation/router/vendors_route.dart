import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../components/dialog_page.dart';
import '../features/dashboard/vendors/vendors_page.dart';
import '../features/invite/vendor_invite_page.dart';
import '../features/vendor/vendor_page.dart';
import 'app_router.dart';

final vendorsRoute = GoRoute(
  path: "/vendors",
  builder: (BuildContext context, GoRouterState state) {
    return const VendorsPage();
  },
  routes: [
    GoRoute(
      path: "create",
      parentNavigatorKey: rootNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return DialogPage(builder: (_) => const VendorInvitePage());
      },
    ),
    GoRoute(
      path: ":id",
      builder: (BuildContext context, GoRouterState state) {
        final vendorId = state.pathParameters['id'];
        return VendorPage(
          vendorId: vendorId ?? '',
        );
      },
    ),
  ],
);
