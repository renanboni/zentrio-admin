import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zentrio_admin/presentation/features/vendor/component/vendor_api_key_card.dart';
import 'package:zentrio_admin/presentation/features/vendor/component/vendor_details_card.dart';
import 'package:zentrio_admin/presentation/features/vendor/vendor_view_model.dart';

import '../../../di/init.dart';

class VendorPage extends StatefulWidget {
  final String vendorId;

  const VendorPage({
    super.key,
    required this.vendorId,
  });

  @override
  State<VendorPage> createState() => _VendorPageState();
}

class _VendorPageState extends State<VendorPage> {
  final VendorViewModel viewModel = getIt<VendorViewModel>();

  @override
  void initState() {
    viewModel.getVendorById(widget.vendorId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveRowColumn(
      layout: ResponsiveRowColumnType.COLUMN,
      rowSpacing: 8,
      columnSpacing: 8,
      children: [
        ResponsiveRowColumnItem(
          child: ResponsiveRowColumn(
            rowSpacing: 12,
            columnSpacing: 8,
            rowCrossAxisAlignment: CrossAxisAlignment.start,
            layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                ? ResponsiveRowColumnType.COLUMN
                : ResponsiveRowColumnType.ROW,
            children: [
              ResponsiveRowColumnItem(
                rowFlex: 2,
                child: ResponsiveRowColumn(
                  layout: ResponsiveRowColumnType.COLUMN,
                  columnSpacing: 16,
                  children: [
                    ResponsiveRowColumnItem(
                      child: VendorDetailsCard(
                        vendor: viewModel.vendor.watch(context),
                      ),
                    ),
                    ResponsiveRowColumnItem(
                      child: VendorApiKeyCard(
                        apiKey: viewModel.apiKey.watch(context),
                      ),
                    ),
                  ],
                ),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: Container(),
              )
            ],
          ),
        )
      ],
    );
  }
}
