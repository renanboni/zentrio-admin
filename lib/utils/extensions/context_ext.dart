import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

extension ResponsiveMaxWidth on BuildContext {
  double get maxWidth {
    final breakpoints = ResponsiveBreakpoints.of(this);
    final screenWidth = MediaQuery.sizeOf(this).width;

    if (breakpoints.isTablet) {
      return screenWidth * 0.75;
    }

    return breakpoints.isMobile || breakpoints.isPhone
        ? screenWidth
        : screenWidth * 0.5;
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
