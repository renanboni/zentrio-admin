import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

extension ResponsiveMaxWidth on BuildContext {
  double get maxWidth {
    final isMobileOrPhone = ResponsiveBreakpoints.of(this).isMobile ||
        ResponsiveBreakpoints.of(this).isPhone;

    return isMobileOrPhone
        ? MediaQuery.sizeOf(this).width
        : MediaQuery.sizeOf(this).width * 0.5;
  }
}

extension Toast on BuildContext {
  void success(String message) {
    ShadToaster.of(this).show(
      ShadToast(
        description: Text(message),
      ),
    );
  }

  void error(String message) {
    ShadToaster.of(this).show(
      ShadToast.destructive(
        title: const Text('Uh oh! Something went wrong'),
        description: Text(message),
      ),
    );
  }
}
