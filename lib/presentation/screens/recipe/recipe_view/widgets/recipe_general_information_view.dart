import 'package:flutter/material.dart';

import '../../../../widgets/star_row.dart';

class RecipeGeneralInformationView extends StatelessWidget {
  final TextStyle _style = const TextStyle(
    fontSize: 18,
    color: Colors.black,
    fontFamily: 'ReemKufi',
  );

  const RecipeGeneralInformationView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 6,
          child: Column(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  text: 'Autor: ',
                  style: _style.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                  children: <InlineSpan>[
                    TextSpan(
                      text: 'Andres Calamaro Rodriguez',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              StarRow(
                size: 20.0,
                value: 3.5,
              )
            ],
          ),
        ),
        Expanded(
          flex: 6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                'Postre',
                style: _style.copyWith(
                  fontSize: 16,
                ),
              ),
              Text(
                '5 personas',
                style: _style.copyWith(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
