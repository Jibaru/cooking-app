import 'package:animate_do/animate_do.dart';
import 'package:cooking_app/widgets/list_option.dart';
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
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          UserHeader(
            height: MediaQuery.of(context).size.height * 0.35,
            avatarRadius: 65,
            backgroundImage: NetworkImage('https://previews.123rf.com/images/gigisomplak/gigisomplak1802/gigisomplak180200022/95163461-hand-draw-sketch-seamless-background-cook-ware-for-wallpaper-backdrop-wrapping-paper-or-other.jpg'),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.54,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  FadeInLeft(
                    delay: Duration(milliseconds: 500),
                    child: ListOption(
                      iconData: Icons.favorite,
                      title: 'Favorite Recipes',
                    ),
                  ),
                  SizedBox(height: 35),
                  FadeInLeft(
                    delay: Duration(milliseconds: 800),
                    child: ListOption(
                      iconData: Icons.list,
                      title: 'My recipes',
                    ),
                  ),
                  SizedBox(height: 35),
                  FadeInLeft(
                    delay: Duration(milliseconds: 1000),
                    child: ListOption(
                      iconData: Icons.history,
                      title: 'History Views',
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}