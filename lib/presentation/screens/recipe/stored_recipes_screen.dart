import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class StoredRecipesScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _storedRecipesScreenScaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _storedRecipesScreenScaffoldKey,
      appBar: AppBar(
        title: Text('Recetas Guardadas'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () =>
              _storedRecipesScreenScaffoldKey.currentState.openDrawer(),
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
