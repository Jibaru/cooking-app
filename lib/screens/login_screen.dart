import 'package:cooking_app/widgets/login_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:cooking_app/utilities/custom_colors.dart';

class LoginScreen extends StatelessWidget {

  final TextStyle _titleStyle = TextStyle(
    color: Colors.white,
    fontSize: 35,
    fontWeight: FontWeight.bold,
    fontFamily: 'arial'
  );

  final TextStyle _redirectStyle = TextStyle(
    color: CustomColors.yellow,
    fontSize: 15,
    letterSpacing: 1,
    fontWeight: FontWeight.w300
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: double.maxFinite,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/login_background.jpg'),
            fit: BoxFit.cover,
          ),

        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 40
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Welcome!', 
                  style: _titleStyle,
                ),
                Text(
                  "Time to cook! Let's Sign In", 
                  style: _titleStyle.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w200
                  ),
                ),
                LoginTextFormField(
                  label: 'Email',
                  margin: EdgeInsets.fromLTRB(10, 20, 10, 5),
                ),
                LoginTextFormField(
                  label: 'Password',
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5
                  ),
                ),
                Text(
                  'Forgot Password?',
                  style: _redirectStyle,
                ),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  onPressed: (){},
                  color: CustomColors.yellow,
                  child: Text(
                    'SIGN IN',
                    style: _titleStyle.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.normal
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 20
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'It\'s your first time here?',
                        style: _titleStyle.copyWith(
                          fontSize: 15,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w300
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Sign up',
                        style: _redirectStyle,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}