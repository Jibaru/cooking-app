import 'package:cooking_app/screens_old/recipe_screen.dart';
import 'package:cooking_app/utilities/custom_colors.dart';
import 'package:flutter/material.dart';

class RecipeGridItem extends StatelessWidget {
  final EdgeInsets margin;
  final String tag;

  static final double maxWidth = 145;
  static final double maxHeight = 220;

  RecipeGridItem({this.tag, this.margin});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => RecipeScreen(
                    tag: tag,
                  ))),
      child: Container(
        margin: margin,
        padding: EdgeInsets.all(5),
        constraints: BoxConstraints(maxWidth: RecipeGridItem.maxWidth),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _createCookImage(true),
            Text(
              'Pizza Hawaii',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontFamily: 'arial'),
            ),
            Text('Ready in 30 minutes',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black54)),
            _createStarsBar(5)
          ],
        ),
      ),
    );
  }

  Widget _createCookImage([bool isFavorite = false]) {
    return Hero(
      tag: tag,
      child: Container(
        width: RecipeGridItem.maxWidth,
        height: 170,
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage(
                      'http://wallpapercrafter.com/uploads/posts/101870-spaghetti_pasta_noodles_food_eat_cook_plate.jpg'),
                  fit: BoxFit.cover,
                )),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: CustomColors.yellow,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createStarsBar([int stars = 0]) {
    return Container(
        child: Row(
      children: List.generate(
          stars,
          (i) => Icon(
                Icons.star,
                size: 20,
                color: CustomColors.yellow,
              )),
    ));
  }
}
