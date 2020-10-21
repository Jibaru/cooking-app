import 'package:cooking_app/utilities/custom_colors.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData prefixIconData;
  final IconData suffixIconData;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final int maxLength;
  final bool obscureText;
  final bool readOnly;
  final VoidCallback onEditingComplete;
  final VoidCallback onTap;
  final ValueChanged<String> onChanged;
  final TextInputAction textInputAction;
  final FormFieldValidator<String> validator;

  AppTextFormField({
    Key key,
    this.controller,
    this.labelText,
    this.prefixIconData,
    this.suffixIconData,
    this.focusNode,
    this.keyboardType,
    this.maxLength,
    this.onEditingComplete,
    this.onTap,
    this.onChanged,
    this.textInputAction,
    this.validator,
    this.obscureText = false,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: CustomColors.blue,
      ),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: keyboardType,
        maxLength: maxLength,
        obscureText: obscureText,
        onTap: onTap,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        textInputAction: textInputAction,
        validator: validator,
        readOnly: readOnly,
        decoration: InputDecoration(
            labelText: labelText,
            labelStyle: TextStyle(
              fontFamily: 'ReemKufi',
              fontSize: 16,
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: CustomColors.blue,
                width: 2.0,
              ),
            ),
            errorMaxLines: 3,
            focusColor: CustomColors.blue,
            prefixIcon: (prefixIconData != null)
                ? Icon(
                    prefixIconData,
                    color: CustomColors.blue,
                  )
                : null,
            suffixIcon: (suffixIconData != null)
                ? Icon(
                    suffixIconData,
                    color: Colors.black38,
                  )
                : null),
        style: TextStyle(
          color: Colors.black54,
          fontFamily: 'ReemKufi',
          fontSize: 18,
        ),
        cursorColor: CustomColors.blue,
        cursorWidth: 1.0,
      ),
    );
  }
}
