
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

extension ResponsiveMaxWidth on BuildContext {
  double get maxWidth {
    final isMobileOrPhone = ResponsiveBreakpoints.of(this).isMobile ||
        ResponsiveBreakpoints.of(this).isPhone;

    return isMobileOrPhone
        ? MediaQuery.sizeOf(this).width
        : MediaQuery.sizeOf(this).width * 0.5;
  }
}