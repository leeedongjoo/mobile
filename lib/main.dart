import 'package:app/routes/app_router.dart';
import 'package:app/screens/login/login_screen.dart';
import 'package:app/helpers/storage_helper.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await StorageHelper.initialized();

  await Supabase.initialize(
      url: "https://daelim-server.fleecy.dev",
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICJyb2xlIjogImFub24iLAogICJpc3MiOiAic3VwYWJhc2UiLAogICJpYXQiOiAxNzE3MzQwNDAwLAogICJleHAiOiAxODc1MTA2ODAwCn0.aMXxldFuuDXaZhl1Ap5bTQS_601EwbOOVE8YdPmAuc8");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: FlexThemeData.light(
        scheme: FlexScheme.outerSpace,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 7,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 10,
          blendOnColors: false,
          useTextTheme: true,
          useM2StyleDividerInM3: true,
          alignedDropdown: true,
          useInputDecoratorThemeInDialogs: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.outerSpace,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 13,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          useTextTheme: true,
          useM2StyleDividerInM3: true,
          alignedDropdown: true,
          useInputDecoratorThemeInDialogs: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
      ),
      themeMode: ThemeMode.light,
      showPerformanceOverlay: false,
      routerConfig: appRouter,
    );
  }
}
// setting.json 내용 뭐 못넣었음 확인하셈

//믿에거가 내토큰
// "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNzI2MDM1MzI2LCJpYXQiOjE3MjYwMzE3MjYsInN1YiI6IjQyODhjY2MwLTliNjktNDAxOS1hM2NlLWU3ZDI3MGFkMTQyNyIsImVtYWlsIjoiMjAxOTMwNDIwQGRhZWxpbS5hYy5rciIsInBob25lIjoiIiwiYXBwX21ldGFkYXRhIjp7InByb3ZpZGVyIjoiZW1haWwiLCJwcm92aWRlcnMiOlsiZW1haWwiXX0sInVzZXJfbWV0YWRhdGEiOnsiZGlzcGxheV9uYW1lIjoi7J2064-Z7KO8Iiwic3R1ZGVudF9udW1iZXIiOiIyMDE5MzA0MjAifSwicm9sZSI6ImF1dGhlbnRpY2F0ZWQiLCJhYWwiOiJhYWwxIiwiYW1yIjpbeyJtZXRob2QiOiJwYXNzd29yZCIsInRpbWVzdGFtcCI6MTcyNjAzMTcyNn1dLCJzZXNzaW9uX2lkIjoiNWYwZmY4ZGUtYmMwYi00ZTFkLWJlOGUtOTMzNzRiNGI0YzFhIiwiaXNfYW5vbnltb3VzIjpmYWxzZX0.PJyEk9gODRqmKxiEgjBT2wgdQ8wxRgZaj2rd145NoiI",
//     "token_type": "bearer",
//     "expires_in": 3600,
//     "expires_at": 1726035326