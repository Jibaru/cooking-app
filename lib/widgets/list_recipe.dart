import 'package:cooking_app/widgets/recipe_tile.dart';
import 'package:flutter/material.dart';

class ListRecipe extends StatelessWidget {
  final List<String> _recipes = List.generate(10, (index) => null);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _recipes.length,
      itemBuilder: (context, i) => RecipeTile(
        height: 120.0,
        margin: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
      ),
    );
  }
}
