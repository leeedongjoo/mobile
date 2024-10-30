import 'package:flutter/material.dart';
import 'package:app/routes/app_screen.dart';
import 'package:lucide_icons/lucide_icons.dart';

enum AppScreen { login, main, setting, users }

extension AppScreenExtension on AppScreen {
  String get toPath {
    switch (this) {
      case AppScreen.login:
        return '/login';
      case AppScreen.main:
        return '/main';
      case AppScreen.setting:
        return '/setting';
    }
  }

  IconData get getIcon {
    switch (this) {
      case AppScreen.main:
        return Icons.home;
      case AppScreen.setting:
        return LucideIcons.settings2;
      default:
        return LucideIcons.dot;
    }
  }
}
