import 'package:app/helpers/storage_helper.dart';
import 'package:app/routes/app_screen.dart';
import 'package:app/screens/login/login_screen.dart';
import 'package:app/screens/main/main_screen.dart';
import 'package:easy_extension/easy_extension.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: AppScreen.login.toPath,
  redirect: (context, state) {
    Log.green('Route FullPath: ${state.fullPath}');

    if (state.fullPath != AppScreen.main.toPath) {
      return null;
    }
    if (StorageHelper.authData == null) {
      return AppScreen.login.toPath;
    }

    return null;
  },
  routes: [
    GoRoute(
      path: AppScreen.login.toPath,
      name: AppScreen.login.name,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: AppScreen.main.toPath,
      name: AppScreen.main.name,
      builder: (context, state) => const MainScreen(),
    )
  ],
);
