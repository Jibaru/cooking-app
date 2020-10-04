import 'package:cooking_app/utilities/custom_colors.dart';
import 'package:flutter/material.dart';

class RecipeScreen extends StatefulWidget {

  final String tag;

  RecipeScreen({
    Key key,
    this.tag
  }) : super(key: key);

  @override
  _RecipeScreenState createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {

  final Widget _constSpacing = const SizedBox(
    height: 20,
  );

  final String _lorem = 'lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: CustomColors.yellow,
        child: Icon(Icons.favorite),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            centerTitle: true,
            elevation: 2.0,
            expandedHeight: 250.0,
            pinned: true,
            backgroundColor: CustomColors.yellow,
            floating: true,
            
            flexibleSpace: FlexibleSpaceBar(
              title: Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Banofee Pie',
                      style: TextStyle(
                        fontSize: 20,
                        shadows: [
                          BoxShadow(
                            blurRadius: 2,
                            color: Colors.black87,
                            offset: Offset(0.0, 1.0)
                          )
                        ]
                      ),
                    ),
                    SizedBox(width: 15,),
                    Icon(Icons.star, size: 12, color: Colors.white,),
                    Text('4', style: TextStyle(fontSize: 12),)
                    
                  ],
                ),
              ),
              background: Hero(
                tag: widget.tag,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('http://wallpapercrafter.com/uploads/posts/101870-spaghetti_pasta_noodles_food_eat_cook_plate.jpg'),
                      fit: BoxFit.cover,
                    )
                  ),
                  
                ),
              ),
            ),
            
          ),
          SliverPadding(
            padding: EdgeInsets.all(20),
            sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                _createTitle('About'),
                _createAbout(),
                _constSpacing,
                _createTitle('Ingredients'),
                _createAbout(),
                Card(
                  color: CustomColors.yellow,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10
                    ),
                    child: Text(
                      _lorem+_lorem+_lorem,
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  )
                )
              ]
            ),
          ),
          )
        ],
      ),
    );
  }

  Widget _createTitle(String text){
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20
      ),
    );
  }

  Widget _createAbout(){
    return Text(_lorem);
  }
}