import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/di/init.dart';
import 'package:zentrio_admin/presentation/components/card_scaffold.dart';
import 'package:zentrio_admin/presentation/features/customers/components/customers_table.dart';
import 'package:zentrio_admin/presentation/features/customers/customers_view_model.dart';

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
      title: "Customers",
      child: CustomersTable(
        customers: viewModel.customers.watch(context),
        onClick: (costumer) {},
        onEdit: (costumer) {},
      ),
    );
  }
}
