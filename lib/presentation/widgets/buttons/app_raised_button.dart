import 'package:flutter/material.dart';

import '../../utils/custom_colors.dart';

class AppRaisedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const AppRaisedButton({
    Key key,
    @required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: CustomColors.blue,
      highlightElevation: 0.5,
      shape: Border.all(
        style: BorderStyle.solid,
        color: Colors.black12,
        width: 0.1,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          25.0,
          10.0,
          25.0,
          10.0,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'ReemKufi',
            fontSize: 18,
          ),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
