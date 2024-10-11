import 'package:app/common/scaffold/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../routes/app_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
        appScreen: AppScreen.setting,
        child: Column(
          children: [
            ListTile(
              //leading: ,
              title: Text('대림대'),
              subtitle: Text('201930420'),
            )
          ],
        ));
  }
}
