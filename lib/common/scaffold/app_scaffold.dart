// import 'package:app/common/scaffold/app_navigation_rail.dart';
// import 'package:app/routes/app_screen.dart';
// import 'package:flutter/material.dart';

// class AppScaffold extends StatelessWidget {
//   final AppScreen appScreen;
//   final Widget child;
//   const AppScaffold({
//     super.key,
//     required this.appScreen,
//     required this.child,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Row(
//           children: [
//             AppNavigationRail(
//               appScreen: appScreen,
//             ),
//             Expanded(
//               child: child,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:app/routes/app_screen.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget? floatingActionButton;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final bool enableDrawer;
  final Widget child;

  const AppScaffold({
    super.key,
    this.floatingActionButton,
    this.appBar,
    this.bottomNavigationBar,
    this.enableDrawer = true,
    required this.child,
    required AppScreen appScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 여기서 Scaffold를 사용하여 화면 구성
      appBar: appBar, // 상단 앱바 설정
      drawer: enableDrawer ? Drawer() : null, // Drawer가 활성화되면 기본 Drawer 사용
      floatingActionButton: floatingActionButton, // 플로팅 액션 버튼 설정
      bottomNavigationBar: bottomNavigationBar, // 하단 네비게이션 바 설정
      body: SafeArea(
        child: child, // 필수로 전달된 child 위젯을 화면에 렌더링
      ),
    );
  }
}
