import 'package:cooking_app/utilities/custom_colors.dart';
import 'package:flutter/material.dart';

class RecipeSearchBar extends StatelessWidget {

  final double width;
  final double height;

  final InputBorder _inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(60),
    borderSide: BorderSide(
      width: 0, 
      color: Colors.transparent
    ),
  );

  final TextStyle _textStyle = TextStyle(
    color: Colors.white60,
    fontSize: 17,
    fontFamily: 'arial'
  );

  RecipeSearchBar({
    this.width = double.maxFinite,
    this.height = 45
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(60),
      child: Container(
        width: width,
        height: height,
        color: Colors.transparent,
        child: TextFormField(
          style: _textStyle.copyWith(
            color: Colors.white
          ),
          cursorColor: Colors.white,
          cursorRadius: Radius.circular(4),
          cursorWidth: 4,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: 'Name of the required dish',
            hintStyle: _textStyle,
            border: _inputBorder,
            enabledBorder: _inputBorder,
            disabledBorder: _inputBorder,
            focusedBorder: _inputBorder,
            filled: true,
            fillColor: CustomColors.yellow,
            suffixIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            contentPadding: EdgeInsets.fromLTRB(20, 5, 5, 20),
          ),
        ),
      ),
    );
  }
}