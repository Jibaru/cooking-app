import 'package:cooking_app/screens/home_screen.dart';
import 'package:cooking_app/screens_old/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:cooking_app/screens_old/login_screen.dart';

typedef RouteFactory = Route<dynamic> Function(RouteSettings settings);

abstract class Router {
  static final Map<String, String> routesNamed = {
    '/login': 'Iniciar Sesión',
    '/main': 'Principal',
    '/home': 'Inicio'
  };

  static final Map<String, WidgetBuilder> routes = {
    '/login': (BuildContext context) => LoginScreen(),
    '/main': (BuildContext context) => MainScreen(),
    '/home': (BuildContext context) => HomeScreen()
  };

  static Future<void> pushVoid(BuildContext context, String route) =>
      Navigator.push(context, MaterialPageRoute(builder: routes[route]));
}
