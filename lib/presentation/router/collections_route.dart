
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:zentrio_admin/presentation/features/collections/collections_page.dart';

import '../components/dialog_page.dart';
import '../features/collection/collection_page.dart';
import '../features/collections/create/create_collection_page.dart';
import 'app_router.dart';

final collectionsRoute =  GoRoute(
  path: "/collections",
  builder: (BuildContext context, GoRouterState state) {
    return const CollectionsPage();
  },
  routes: [
    GoRoute(
      path: "create",
      parentNavigatorKey: rootNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return DialogPage(
          builder: (_) => const CreateCollectionPage(),
        );
      },
    ),
    GoRoute(
      path: ":id",
      builder: (BuildContext context, GoRouterState state) {
        final collectionId = state.pathParameters['id'];
        return CollectionPage(
          collectionId: collectionId ?? '',
        );
      },
    ),
  ]
);
