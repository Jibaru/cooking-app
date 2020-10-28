import 'package:flutter/material.dart';

import '../../utils/custom_colors.dart';
import '../../widgets/widgets.dart';

class MyRecipesScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _myRecipesScreenScaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _myRecipesScreenScaffoldKey,
      appBar: AppBar(
        title: Text('Mis recetas'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () =>
              _myRecipesScreenScaffoldKey.currentState.openDrawer(),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: CustomColors.blue,
        onPressed: () => Navigator.pushNamed(context, '/recipe-create'),
      ),
    );
  }
}
