import 'package:app/common/scaffold/app_scaffold.dart';
import 'package:flutter/material.dart';

import '../../routes/app_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        appScreen: AppScreen.main,
        child: Center(
          child: Text('설정'),
        ));
  }
}
