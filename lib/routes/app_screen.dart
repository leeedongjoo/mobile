enum AppScreen { login, main }

extension AppScreenExtension on AppScreen {
  String get toPath {}
  String get toName {}
}
