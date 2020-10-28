import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class FavoriteRecipesScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _favoriteRecipesScreenScaffoldKey =
      GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _favoriteRecipesScreenScaffoldKey,
      appBar: AppBar(
        title: Text('Recetas Favoritas'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () =>
              _favoriteRecipesScreenScaffoldKey.currentState.openDrawer(),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            // TODO: Add function to search recipe
            onPressed: () => {},
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: ListRecipe(),
    );
  }
}
