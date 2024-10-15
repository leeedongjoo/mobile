// import 'package:app/common/scaffold/app_scaffold.dart';
// import 'package:flutter/material.dart';

// class MainScreen extends StatelessWidget {
//   const MainScreen({super.key});

//   class _MainScreenState extends State<MainScreen> {
//   int selectedIndex = 0; // 선택된 항목 인덱스

//   @override
//   Widget build(BuildContext context) {
//     return const AppScaffold();
//   }
// }

//   @override
//   Widget build(BuildContext context) {
//     return const AppScaffold();
//   }

// }

import 'package:flutter/material.dart';
import 'package:app/common/scaffold/app_scaffold.dart';
import 'package:app/routes/app_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0; // 선택된 항목 인덱스

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appScreen: AppScreen.main, // 필수 인자 'appScreen' 추가
      child: Center(
        // 필수 인자 'child' 추가
        child: Text('Main Screen Content Here'), // 예시 내용
      ),
    );
  }
}
