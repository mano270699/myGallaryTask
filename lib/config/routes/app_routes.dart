import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mygellary/data/Api/api.dart';
import 'package:mygellary/data/repositories/auth_reposatory.dart';
import 'package:mygellary/data/repositories/gellary_reposatory.dart';
import 'package:mygellary/features/login/cubit/cubit/login_cubit.dart';
import 'package:mygellary/features/splash/splash.dart';

import '../../core/utils/app_strings.dart';

import '../../features/login/screens/login_screen.dart';
import '../../features/mygellary/cubit/cubit/gellary_cubit.dart';
import '../../features/mygellary/screens/mygellary_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String loginScreen = '/login';
  static const String myGellaryScreen = '/myGellary-screen';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) {
          return const SplashScreen();
        });
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: (context) => LoginCubit(AuthRepository(AppApi())),
            child: LoginScreen(),
          );
        });

      case Routes.myGellaryScreen:
        return MaterialPageRoute(builder: ((context) {
          return BlocProvider(
            create: (context) =>
                GellaryCubit(GellaryRepository(AppApi()))..getAllMyGallery(),
            child: const MyGellaryScreen(),
          );
        }));
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: ((context) => const Scaffold(
              body: Center(
                child: Text(AppStrings.noRouteFound),
              ),
            )));
  }
}
