import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'device_screen_type.dart';
import 'sizing_information.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    SizingInformation sizingInformation,
  ) builder;

  const ResponsiveBuilder({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return LayoutBuilder(
      builder: (context, boxConstraints) {
        var sizingInformation = SizingInformation(
          deviceScreenType: _getDeviceType(context),
          screenSize: mediaQuery.size,
          localWidgetSize: Size(
            boxConstraints.maxWidth,
            boxConstraints.maxHeight,
          ),
        );
        return builder(context, sizingInformation);
      },
    );
  }

  DeviceScreenType _getDeviceType(BuildContext context) {
    if (ResponsiveBreakpoints.of(context).isPhone ||
        ResponsiveBreakpoints.of(context).isMobile) {
      return DeviceScreenType.mobile;
    }

    if (ResponsiveBreakpoints.of(context).isDesktop) {
      return DeviceScreenType.desktop;
    }

    if (ResponsiveBreakpoints.of(context).isTablet) {
      return DeviceScreenType.tablet;
    }

    return DeviceScreenType.mobile;
  }
}
