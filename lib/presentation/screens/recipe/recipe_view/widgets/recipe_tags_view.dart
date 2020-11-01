import 'package:flutter/material.dart';

import '../../../../utils/custom_colors.dart';

final TextStyle titleTextStyle = const TextStyle(
  color: Colors.black87,
  fontFamily: 'ReemKufi',
  fontSize: 18,
);

class RecipeTagsView extends StatelessWidget {
  const RecipeTagsView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          'Tags',
          style: titleTextStyle,
        ),
        Wrap(
          spacing: 5,
          runSpacing: -10,
          children: List.generate(
            10,
            (i) => Chip(
              padding: EdgeInsets.zero,
              label: Text('Postre $i'),
              labelStyle: TextStyle(
                color: Colors.white,
                fontFamily: 'ReemKufi',
                fontSize: 15,
              ),
              backgroundColor: CustomColors.yellow,
            ),
          ),
        ),
      ],
    );
  }
}
