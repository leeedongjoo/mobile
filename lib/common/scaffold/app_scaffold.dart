import 'package:app/common/scaffold/app_navigation_rail.dart';
import 'package:app/routes/app_screen.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final AppScreen appScreen;
  final PreferredSizeWidget? appBar;
  final Widget child;

  const AppScaffold({
    super.key,
    required this.appScreen,
    this.appBar,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            AppNavigationRail(appScreen: appScreen),
            Expanded(
              child: Column(
                children: [
                  if (appBar != null) appBar!,
                  Expanded(child: child),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
