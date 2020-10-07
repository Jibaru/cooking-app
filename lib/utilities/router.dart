import 'package:cooking_app/screens/home_screen.dart';
import 'package:cooking_app/screens/notification_screen.dart';
import 'package:cooking_app/screens/profile_screen.dart';
import 'package:cooking_app/screens/setting_screen.dart';
import 'package:cooking_app/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:cooking_app/screens/login_screen.dart';

typedef RouteFactory = Route<dynamic> Function(RouteSettings settings);

abstract class Router {
  static final Map<String, String> routesNamed = {
    '/login': 'Iniciar Sesión',
    '/setting': 'Configuración',
    '/profile': 'Perfil',
    '/notification': 'Notificaciones',
  };

  static final Map<String, WidgetBuilder> routes = {
    '/home': (BuildContext context) => HomeScreen(),
    '/login': (BuildContext context) => LoginScreen(),
    '/signin': (BuildContext context) => SigninScreen(),
    '/setting': (BuildContext context) => SettingScreen(),
    '/profile': (BuildContext context) => ProfileScreen(),
    '/notification': (BuildContext context) => NotificationScreen(),
  };
}
