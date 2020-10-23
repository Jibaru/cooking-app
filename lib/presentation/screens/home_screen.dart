import 'package:flutter/material.dart';

import '../utils/custom_colors.dart';
import '../utils/router.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _homeScreenScaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _homeScreenScaffoldKey,
      appBar: AppBar(
        title: Text('Recetas'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => _homeScreenScaffoldKey.currentState.openDrawer(),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            // TODO: Add function to search recipe
            onPressed: () => {},
          ),
          PopupMenuButton(
            onSelected: (value) => Navigator.pushNamed(context, value),
            offset: Offset(10.0, 5.0),
            itemBuilder: (context) {
              return Router.routesNamed.keys
                  .map((key) => PopupMenuItem<String>(
                        value: key,
                        child: Text(Router.routesNamed[key]),
                      ))
                  .toList();
            },
          )
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
