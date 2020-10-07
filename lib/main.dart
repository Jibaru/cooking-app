import 'package:cooking_app/utilities/app_theme.dart';
import 'package:flutter/material.dart';
import 'utilities/router.dart';

void main() {
  runApp(CookingApp());
}

class CookingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).copyWith(
        appBarTheme: AppTheme.appBarTheme(context),
        floatingActionButtonTheme: AppTheme.floatingActionButtonTheme(context),
      ),
      title: 'Cooking App',
      routes: Router.routes,
      initialRoute: '/home',
      //onUnknownRoute: _router.unknownRouteSolver,
    );
  }
}
