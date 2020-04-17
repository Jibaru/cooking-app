import 'package:flutter/material.dart';
import 'utilities/router.dart';

void main(){

  runApp(CookingApp());

}

class CookingApp extends StatelessWidget {

  final Router _router = Router();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      title: 'Cooking App',
      routes: _router.routes,
      initialRoute: '/login',
      //onUnknownRoute: _router.unknownRouteSolver,
    );
  }
}