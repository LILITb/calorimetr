import 'package:caloriegram/utils/routes/routes_name.dart';
import 'package:caloriegram/views/splash_screen.dart';
import 'package:flutter/material.dart';

import '../../views/accounted_sceens/login_screen.dart';
import '../../views/home_screens/home_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (BuildContext context) => const HomeScreen(),
        );
      case RoutesName.splash:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SplashScreen(),
        );
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (BuildContext context) =>const LoginScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) {
            return const Scaffold(
              body: Center(
                child: Text('No route defined'),
              ),
            );
          },
        );
    }
  }
}
