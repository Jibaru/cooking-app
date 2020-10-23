import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/notification_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/recipe_create_screen.dart';
import '../screens/setting_screen.dart';
import '../screens/signin_screen.dart';
import '../screens/login_screen.dart';

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
    '/recipe-create': (BuildContext context) => RecipeCreateScreen()
  };
}
