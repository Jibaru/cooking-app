
import 'package:cooking_app/screens/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:cooking_app/screens/login_screen.dart';

typedef RouteFactory = Route<dynamic> Function(RouteSettings settings);

class Router {

  static final Router _router = Router._internal();

  final Map<String, WidgetBuilder> _routes = {
    '/login': (BuildContext context) => LoginScreen(),
    '/main': (BuildContext context) => MainScreen()
  };

  Map<String, WidgetBuilder> get routes => _routes;

  WidgetBuilder get unknownRouteSolver => _routes['login'];

  factory Router() {
    return _router;
  }

  Router._internal();

}