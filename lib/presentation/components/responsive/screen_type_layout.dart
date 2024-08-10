import 'package:flutter/material.dart';

import 'device_screen_type.dart';
import 'responsive_builder.dart';

class ScreenTypeLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet, desktop;

  const ScreenTypeLayout({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizeInformation) {
      if (sizeInformation.deviceScreenType == DeviceScreenType.tablet) {
        if (tablet != null) {
          return tablet!;
        }
      }

      if (sizeInformation.deviceScreenType == DeviceScreenType.desktop) {
        if (desktop != null) {
          return desktop!;
        }
      }

      return mobile;
    });
  }
}