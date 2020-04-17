import 'package:cooking_app/widgets/recipe_filter_bar.dart';
import 'package:cooking_app/widgets/recipe_grid_item.dart';
import 'package:cooking_app/widgets/recipe_search_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final int _animationMilliseconds = 350;

  int _recipes = 5;
  double _cardWhiteHeight;
  final double _headerHeight = 200;

  final TextStyle _titleStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w800,
    fontSize: 35,
    letterSpacing: 1.1
  );

  @override
  void initState() {
    super.initState();
    _cardWhiteHeight = 200;
    WidgetsBinding.instance
      .addPostFrameCallback(
        (_) => setState(() => _cardWhiteHeight = _calculateHeight(context))
      );
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black87,
            Colors.black
          ],
          begin: Alignment.topLeft,
          end: Alignment.topRight,
        )
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: _headerHeight,
              padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Hero(
                    tag: 'cook-hero-title',
                    child: Material(
                      color: Colors.transparent,
                      child: Container(
                        child: Text(
                          'What do you want to cook?',
                          textAlign: TextAlign.center,
                          style: _titleStyle,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Choose a recipe and be brave, it\'s time to create a masterpiece!',
                    textAlign: TextAlign.center,
                    style: _titleStyle.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w200
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: AnimatedContainer(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height
              ),
              duration: Duration(milliseconds: _animationMilliseconds),
              curve: Curves.bounceInOut,
              width: MediaQuery.of(context).size.width,
              height: _cardWhiteHeight,
              padding: EdgeInsets.fromLTRB(25, 20, 25, 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25)
                )
              ),
              child: Wrap(
                alignment: WrapAlignment.center,
                children: <Widget>[
                  Hero(
                    tag: 'cook-hero-01',
                    child: RecipeSearchBar(),
                  ),
                  RecipeFilterBar(
                    options: [
                      'All',
                      'Salad',
                      'Meat',
                      'Pizza',
                      'Burguer',
                      'Salad2',
                      'Meat2',
                      'Pizza2',
                      'Burguer2',
                    ],
                    onTap: (option) => print(option),
                  ),
                  Container(
                    height: 300,
                    width: double.maxFinite,
                    child: GridView.builder(
                      itemCount: _recipes,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 5.0,
                        childAspectRatio: RecipeGridItem.maxWidth / RecipeGridItem.maxHeight
                      ),
                      itemBuilder: (context, index) {
                        return RecipeGridItem();
                      },
                    ),
                  )
                ],
              )
            ),
          ),
        ],
      ), 
    );
  }

  double _calculateHeight(context) => MediaQuery.of(context).size.height - _headerHeight - 80;
  
}