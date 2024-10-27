import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/di/init.dart';
import 'package:zentrio_admin/presentation/components/card_scaffold.dart';
import 'package:zentrio_admin/presentation/features/customers/components/customers_table.dart';
import 'package:zentrio_admin/presentation/features/customers/customers_view_model.dart';
import 'package:zentrio_admin/utils/extensions/localization_ext.dart';
import 'package:zentrio_admin/utils/extensions/string_ext.dart';

import '../../components/data_table_view.dart';
import '../../components/edit_context_menu.dart';

class CustomersPage extends StatefulWidget {
  const CustomersPage({super.key});

  @override
  State<CustomersPage> createState() => _CustomersPageState();
}

class _CustomersPageState extends State<CustomersPage> {
  final CustomersViewModel viewModel = getIt<CustomersViewModel>();

  @override
  Widget build(BuildContext context) {
    return CardScaffold(
      title: context.loc.customers,
      child: Expanded(
        child: DataTableView(
          onRowTap: (customer) {
            GoRouter.of(context).go("/customers/${customer.id}");
          },
          columns:  [
            context.loc.email,
            context.loc.name,
            context.loc.account,
            context.loc.create,
            "",
          ],
          data: viewModel.customers.value.data,
          cellBuilder: (customer) => [
            DataCell(Text(customer.email)),
            DataCell(Text("${customer.firstName} ${customer.lastName}")),
            DataCell(Text(customer.hasAccount ? context.loc.registered : context.loc.guest)),
            DataCell(Text(customer.createdAt.yMMMd())),
            DataCell(
              Align(
                alignment: Alignment.centerRight,
                child: EditContextMenu(
                  deleteDialogTitle: context.loc.areYouSure,
                  deleteDialogDescription:
                  "You are about to delete the customer ${customer.firstName} ${customer.lastName}. This action cannot be undone.",
                  onEdit: () => {
                    GoRouter.of(context)
                        .go("/customers/${customer.id}/edit")
                  },
                  onDelete: () => {
                 /*   viewModel.deleteProductTag(customer, () {
                      context.success("Tag deleted successfully");
                      GoRouter.of(context).pop();
                    }, () {
                      context.error("Failed to delete tag");
                    })*/
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
