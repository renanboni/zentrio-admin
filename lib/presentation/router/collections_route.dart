
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:zentrio_admin/presentation/features/collections/collections_page.dart';

final collectionsRoute =  GoRoute(
  path: "/collections",
  builder: (BuildContext context, GoRouterState state) {
    return const CollectionsPage();
  },
);
