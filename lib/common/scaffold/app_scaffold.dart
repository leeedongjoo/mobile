import 'package:app/common/scaffold/app_navigation_rail.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;
  const AppScaffold({
    super.key,
    required child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            const AppNavigationRail(),
            Expanded(
              child: child,
            )
          ],
        ),
      ),
    );
  }
}
