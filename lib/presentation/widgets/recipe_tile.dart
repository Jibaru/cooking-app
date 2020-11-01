import 'package:flutter/material.dart';

import 'star_row.dart';
import '../screens/recipe/recipe_view/recipe_view_screen.dart';

class RecipeTile extends StatefulWidget {
  static const double aspectRatio = 3.5;
  final EdgeInsets margin;
  final double height;
  final bool showStatus;

  RecipeTile({
    Key key,
    @required this.height,
    this.showStatus = false,
    this.margin = const EdgeInsets.all(5.0),
  }) : super(key: key);

  @override
  _RecipeTileState createState() => _RecipeTileState();
}

class _RecipeTileState extends State<RecipeTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1.0,
      margin: widget.margin,
      shape: Border.all(
        style: BorderStyle.solid,
        width: 0.2,
        color: Colors.black45,
      ),
      child: InkWell(
        // TODO: Redirect to recipe view screen
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RecipeViewScreen()),
        ),
        splashColor: Colors.black12,
        highlightColor: Colors.white60,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Container
              Container(
                width: 120,
                height: widget.height,
                color: Colors.black12,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://dummyimage.com/120x120/918291/f7f7f7.png',
                      ),
                    ),
                  ),
                ),
              ),
              // Description of Recipe
              Expanded(
                child: Container(
                  height: widget.height,
                  constraints: BoxConstraints(
                    minWidth: 120.0,
                  ),
                  padding: const EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Mazamorra morada con piña',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              fontFamily: 'ReemKufi',
                              height: 1.0,
                            ),
                          ),
                          RichText(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                              text: 'Autor: ',
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                fontFamily: 'ReemKufi',
                                height: 1.0,
                              ),
                              children: <InlineSpan>[
                                TextSpan(
                                  text: 'Ignacio Raúl Rueda Boada',
                                  style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TotalTimePreview(
                            size: 16,
                          ),
                          if (widget.showStatus) Text('Aceptado'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FavoriteButton(
                                size: 16,
                              ),
                              StarRow(
                                size: 16.0,
                                value: 4.5,
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TotalTimePreview extends StatelessWidget {
  final double size;

  TotalTimePreview({
    Key key,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(
            Icons.timer,
            color: Colors.black45,
            size: size,
          ),
          Text(
            '1h 45 min',
            style: TextStyle(
              color: Colors.black45,
              fontFamily: 'ReemKufi',
              fontSize: size - 3,
            ),
          ),
        ],
      ),
    );
  }
}

typedef StatusCallback = void Function(bool);

/// [Favorite Button] display total amount of people liked a recipe and
/// provides a [StatusCallback] to manage the statement outside the widget
class FavoriteButton extends StatefulWidget {
  final StatusCallback onChanged;
  final double size;

  FavoriteButton({
    Key key,
    this.onChanged,
    this.size,
  }) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool _isActive = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          InkWell(
            child: Icon(
              _isActive ? Icons.favorite : Icons.favorite_border,
              color: _isActive ? Colors.red[400] : Colors.black45,
              size: widget.size,
            ),
            borderRadius: BorderRadius.circular(20.0),
            onTap: () {
              setState(() {
                _isActive = !_isActive;
                widget.onChanged?.call(_isActive);
              });
            },
          ),
          Text(
            '12',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: widget.size - 3,
            ),
          ),
        ],
      ),
    );
  }
}
