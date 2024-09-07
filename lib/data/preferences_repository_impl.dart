
import 'package:flutter/src/material/app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signals_core/src/core/signals.dart';

import '../domain/repositories/preferences_repository.dart';

const themeModeKey = 'themeMode';

class PreferencesRepositoryImpl implements PreferencesRepository {
  final SharedPreferences sharedPreferences;

  final Signal<ThemeMode> themeMode = Signal(ThemeMode.system);

  PreferencesRepositoryImpl(this.sharedPreferences) {
    themeMode.value = _getTheme();
  }

  @override
  Signal<ThemeMode> theme() {
    return themeMode;
  }

  @override
  Future<void> saveTheme(ThemeMode themeMode) async {
    await sharedPreferences.setInt(themeModeKey, themeMode.index);
    this.themeMode.value = themeMode;
  }

  _getTheme() {
    final themeModeIndex = sharedPreferences.getInt(themeModeKey);
    return themeModeIndex != null ? ThemeMode.values[themeModeIndex] : ThemeMode.system;
  }
}