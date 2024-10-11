import 'package:app/routes/app_screen.dart';
import 'package:app/routes/app_screen.dart';
import 'package:flutter/material.dart';

import '../../routes/app_screen.dart';

class AppNavigationRail extends StatelessWidget {
  final AppScreen appScreen;
  final Widget child;
  const AppNavigationRail({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
        onDestinationSelected: (value) {},
        selectedIndex: 0,
        selectedIcons: AppScreen.values.map((e) {
          return NavigationRailDestination(
            icon: Icons(e.getIcon),
            label: Text(e.name),
          );
        }));
  }
}
