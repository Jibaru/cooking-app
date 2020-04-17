import 'package:cooking_app/utilities/custom_colors.dart';
import 'package:flutter/material.dart';

typedef VoidCallback = void Function();

class RoundedButton extends StatelessWidget {

  final double width;
  final double height;
  final Color color;
  final BorderRadius borderRadius;
  final TextAlign textAlign;
  final double fontSize;
  final String text;
  final VoidCallback onTap;

  const RoundedButton({
    @required this.text,
    this.width = double.maxFinite,
    this.height = 45,
    this.color = CustomColors.yellow,
    this.borderRadius = const BorderRadius.all(Radius.circular(50)),
    this.textAlign = TextAlign.center,
    this.fontSize = 20,
    this.onTap
  }) : assert(text != null);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color,
            boxShadow: [
              BoxShadow(
                blurRadius: 2,
                color: Colors.black26,
                offset: Offset(1.0, 1.0)
              )
            ]
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
              fontFamily: 'arial',
              shadows: [
                BoxShadow(
                  blurRadius: 2,
                  color: Colors.black26,
                  offset: Offset(0.0, 1.0)
                )
              ]
            ),
          ),
        ),
      ),
    );
  }
}