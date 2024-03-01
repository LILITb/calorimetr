import 'package:caloriegram/futures/home_pages/home_page.dart';
import 'package:caloriegram/utils/routes/routes_name.dart';
import 'package:caloriegram/futures/accounted_sceens/sign_up/signup_page.dart';
import 'package:flutter/material.dart';

import '../../futures/accounted_sceens/login/login_screen.dart';
import '../../futures/accounted_sceens/resset_password/resset_password_screen.dart';

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name!);
}

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var routingData = settings.name?.getRoutingData;
    switch (routingData?.route) {
      case RoutesName.home:
        return _getPageRoute(const HomePage(), settings);
      case RoutesName.signup:
        return _getPageRoute(const SignUpPage(), settings);
      case RoutesName.ressetPassword:
        return _getPageRoute(const RessetPasswordPage(), settings);
      default:
        return _getPageRoute(const LoginScreen(), settings);
    }
  }
}

class RoutingData {
  final String route;
  final Map<String, String> _queryParameters;

  RoutingData({
    required this.route,
    required Map<String, String> queryParameters,
  }) : _queryParameters = queryParameters;

  operator [](String key) => _queryParameters[key];
}

extension StringExtension on String {
  RoutingData get getRoutingData {
    var uriData = Uri.parse(this);
    // print('queryParameters: ${uriData.queryParameters} path: ${uriData.path}');
    return RoutingData(
      queryParameters: uriData.queryParameters,
      route: uriData.path,
    );
  }
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;

  _FadeRoute({required this.child, required this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          transitionDuration: const Duration(seconds: 0),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
