import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:zentrio_admin/presentation/components/card_scaffold.dart';

class ProductTypesPage extends StatelessWidget {
  const ProductTypesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CardScaffold(
      title: "Product Types",
      subtitle: "Organize your products into types.",
      trailing: ShadButton(
        size: ShadButtonSize.sm,
        child: const Text('Create'),
        onPressed: () {
          GoRouter.of(context).go("/product_types/create");
        },
      ),
      child: Expanded(child: Container()),
    );
  }
}
