import 'package:flutter/material.dart';
import 'package:cooking_app/utilities/custom_colors.dart';

class LoginTextFormField extends StatelessWidget {

  final String label;
  final EdgeInsets margin;

  final TextStyle _inputStyle = TextStyle(
    color: Colors.white,
    fontSize: 15,
    letterSpacing: 1,
    fontWeight: FontWeight.w100
  );

  final BorderSide _borderSide = BorderSide(
    color: CustomColors.yellow,
    style: BorderStyle.solid,
    width: 2
  );

  final InputBorder _inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(50),
    borderSide: BorderSide(
      color: CustomColors.yellow,
      style: BorderStyle.solid,
      width: 2
    )
  );

  LoginTextFormField({
    @required this.label,
    this.margin
  }) : assert(label != null);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: this.margin,
      child: TextFormField(
        style: _inputStyle,
        decoration: InputDecoration(
          labelText: this.label,
          hintStyle: _inputStyle,
          labelStyle: _inputStyle,
          border: _inputBorder,
          disabledBorder: _inputBorder.copyWith(
            borderSide: _borderSide.copyWith(
              color: Colors.white60
            )
          ),
          focusedBorder: _inputBorder,
          enabled: true,
          enabledBorder: _inputBorder,
          contentPadding: EdgeInsets.only(left: 25)
        ),
      ),
    );
  }
}