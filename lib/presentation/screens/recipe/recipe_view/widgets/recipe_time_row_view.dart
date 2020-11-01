import 'package:flutter/material.dart';

class RecipeTimeRowView extends StatelessWidget {
  const RecipeTimeRowView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          width: (MediaQuery.of(context).size.width - 30.0) * 0.33,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.timer),
              Text('Tiempo Prep.'),
              Text('20 min'),
            ],
          ),
        ),
        Container(
          width: (MediaQuery.of(context).size.width - 30.0) * 0.33,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Tiempo Total'),
              Text('1h 15 min'),
            ],
          ),
        ),
        Container(
          width: (MediaQuery.of(context).size.width - 30.0) * 0.33,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.timer),
              Text('Tiempo Coc.'),
              Text('20 min'),
            ],
          ),
        )
      ],
    );
  }
}
