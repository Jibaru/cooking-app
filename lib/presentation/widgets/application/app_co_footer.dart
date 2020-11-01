import 'package:flutter/material.dart';

class AppCoFotter extends StatelessWidget {
  final EdgeInsetsGeometry padding;

  const AppCoFotter({
    this.padding = const EdgeInsets.all(0.0),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        'Ignacio Rueda Boada - 2020',
        style: TextStyle(
          fontSize: 12,
          color: Colors.black54,
          fontFamily: 'arial',
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
