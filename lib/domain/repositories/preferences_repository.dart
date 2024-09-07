
import 'package:flutter/material.dart';
import 'package:signals/signals.dart';

abstract class PreferencesRepository {
  Future<void> saveTheme(ThemeMode themeMode);
  Signal<ThemeMode> theme();
}