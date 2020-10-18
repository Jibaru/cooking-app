import 'package:cooking_app/utilities/custom_colors.dart';
import 'package:cooking_app/extensions/double_extension.dart';
import 'package:flutter/material.dart';

/// [StarRow] show stars for valuated recipes
class StarRow extends StatelessWidget {
  final double value;
  final double size;
  StarRow({
    this.size,
    this.value = 0.0,
  }) : assert(value >= 0.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: List.generate(
          5,
          (index) => Icon(
            _defineIcon(index),
            color: CustomColors.yellow,
            size: size,
          ),
        ),
      ),
    );
  }

  IconData _defineIcon(int index) {
    IconData iconData;

    if (value.hasDecimals()) {
      if (index + 1 <= value.toInt())
        iconData = Icons.star;
      else if (index + 1 == value.toInt() + 1)
        iconData = Icons.star_half;
      else
        iconData = Icons.star_border;
    } else {
      if (index + 1 <= value)
        iconData = Icons.star;
      else
        iconData = Icons.star_border;
    }
    return iconData;
  }
}
