import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class DownloadedRecipesScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _downloadedRecipesScreenScaffoldKey =
      GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _downloadedRecipesScreenScaffoldKey,
      appBar: AppBar(
        title: Text('Recetas Descargadas'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () =>
              _downloadedRecipesScreenScaffoldKey.currentState.openDrawer(),
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
