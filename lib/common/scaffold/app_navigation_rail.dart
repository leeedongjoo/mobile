// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app/routes/app_screen.dart';
import 'package:app/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:easy_extension/easy_extension.dart';
import '../../routes/app_screen.dart';
import 'package:app/helpers/api_helper.dart';

class AppNavigationRail extends StatelessWidget {
  final AppScreen appScreen;

  const AppNavigationRail({
    super.key,
    required this.appScreen,
  });

  @override
  Widget build(BuildContext context) {
    final screens = List<AppScreen>.from(AppScreen.values);
    screens.removeAt(0);

    return Column(
      children: [
        Expanded(
          child: NavigationRail(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            onDestinationSelected: (value) {
              final screen = screens[value];
              context.pushNamed(screen.name);
            },
            selectedIndex: appScreen.index - 1,
            destinations: screens.map((e) {
              return NavigationRailDestination(
                icon: Icon(e.getIcon),
                label: Text(e.name),
              );
            }).toList(),
          ),
        ),
        10.heightBox,
        IconButton(
          onPressed: () => ApiHelper.signOut(context),
          icon: const Icon(LucideIcons.logOut),
        ),
        10.heightBox,
      ],
    );
  }
}
