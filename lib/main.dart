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
      theme: Theme.of(context),
      title: 'Cooking App',
      routes: Router.routes,
      initialRoute: '/home',
      //onUnknownRoute: _router.unknownRouteSolver,
    );
  }
}
