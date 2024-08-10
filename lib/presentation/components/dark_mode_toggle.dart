import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:signals/signals_flutter.dart';

import '../../main.dart';

class DarkModeToggle extends StatelessWidget {
  const DarkModeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Watch((_) {
      final isDark = brightness() == Brightness.dark;
      return ShadButton.outline(
        size: ShadButtonSize.sm,
        onPressed: () {
          brightness.value = isDark ? Brightness.light : Brightness.dark;
        },
        icon: Icon(
          isDark ? Icons.light_mode : Icons.dark_mode,
          size: 16,
        ),
      );
    });
  }
}
