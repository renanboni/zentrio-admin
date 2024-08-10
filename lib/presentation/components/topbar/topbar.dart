
import 'package:flutter/material.dart';
import 'package:zentrio_admin/presentation/components/dark_mode_toggle.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          DarkModeToggle(),
        ],
      ),
    );
  }
}
