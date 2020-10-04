import 'package:cooking_app/utilities/router.dart';
import 'package:cooking_app/widgets/list_recipe.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recetas'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          // TODO: Add function to open sidebar
          onPressed: () => {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            // TODO: Add function to search recipe
            onPressed: () => {},
          ),
          PopupMenuButton(
            onSelected: (value) => Router.pushVoid(context, value),
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
      body: ListRecipe(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        // TODO: Add function to redirect to create recipe screen
        onPressed: () => {},
      ),
    );
  }
}
