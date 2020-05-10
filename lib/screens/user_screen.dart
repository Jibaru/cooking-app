import 'package:cooking_app/widgets/user_header.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {

  UserScreen({Key key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Column(
         children: <Widget>[
           UserHeader(
             avatarRadius: 80,
             backgroundImage: NetworkImage('https://previews.123rf.com/images/gigisomplak/gigisomplak1802/gigisomplak180200022/95163461-hand-draw-sketch-seamless-background-cook-ware-for-wallpaper-backdrop-wrapping-paper-or-other.jpg'),
           )
         ],
       ),
    );
  }
}