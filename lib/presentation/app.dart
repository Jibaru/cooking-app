import 'package:flutter/material.dart';

import './utils/app_theme.dart';
import './utils/router.dart';

class App extends StatelessWidget {
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
