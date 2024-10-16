import 'package:app/common/scaffold/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:app/routes/app_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      appScreen: AppScreen.main,
      child: Center(
        child: Text(
          '메인',
          style: TextStyle(
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}
