
import 'package:flutter/material.dart';
import 'package:zentrio_admin/presentation/components/dark_mode_toggle.dart';

import '../../../di/init.dart';
import '../../../domain/repositories/preferences_repository.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          DarkModeToggle(
            preferencesRepository: getIt<PreferencesRepository>(),
          ),
        ],
      ),
    );
  }
}
