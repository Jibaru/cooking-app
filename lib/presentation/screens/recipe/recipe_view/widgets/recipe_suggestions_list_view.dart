import 'package:flutter/material.dart';

import '../recipe_view_screen.dart';

final TextStyle titleTextStyle = const TextStyle(
  color: Colors.black87,
  fontFamily: 'ReemKufi',
  fontSize: 18,
);

class RecipeSuggestionsListView extends StatelessWidget {
  const RecipeSuggestionsListView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          'Recetas Similares',
          style: titleTextStyle,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 220.0,
          child: ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              return GestureDetector(
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => RecipeViewScreen()),
                ),
                child: Container(
                  width: 140.0,
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 0.5,
                          spreadRadius: 0.5)
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.network(
                        'https://i.pinimg.com/736x/a7/0b/43/a70b4366c44a741d2aa603ce48ca972d.jpg',
                        fit: BoxFit.cover,
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Arroz con Pollo a la valeriana con champiñones y pescado',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            maxLines: 4,
                            style: TextStyle(
                              color: Colors.black54,
                              fontFamily: 'ReemKufi',
                              height: 1.0,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
