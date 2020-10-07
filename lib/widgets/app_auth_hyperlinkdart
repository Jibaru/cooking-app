import 'package:flutter/material.dart';

class AppAuthHyperlink extends StatelessWidget {
  final String questionText;
  final String hyperlinkText;
  final VoidCallback onTapHyperlink;
  final EdgeInsetsGeometry padding;

  const AppAuthHyperlink({
    @required this.questionText,
    @required this.hyperlinkText,
    this.onTapHyperlink,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[
          Text(
            questionText,
            style: TextStyle(
              color: Colors.black38,
              fontFamily: 'ReemKufi',
              fontSize: 14,
            ),
          ),
          SizedBox(
            width: 5.0,
          ),
          GestureDetector(
            onTap: onTapHyperlink,
            child: Text(
              hyperlinkText,
              style: TextStyle(
                color: Colors.black38,
                fontFamily: 'ReemKufi',
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
