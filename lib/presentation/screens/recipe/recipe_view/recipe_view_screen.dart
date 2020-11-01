import 'package:flutter/material.dart';

import './widgets/recipe_general_information_view.dart';
import './widgets/recipe_suggestions_list_view.dart';
import './widgets/recipe_tags_view.dart';
import './widgets/recipe_steps_view.dart';
import './widgets/recipe_equipments_view.dart';
import './widgets/recipe_ingredients_view.dart';
import './widgets/recipe_time_row_view.dart';

import '../../../utils/custom_colors.dart';
import '../../../../extensions/list_extension.dart';

final TextStyle titleTextStyle = const TextStyle(
  color: Colors.black87,
  fontFamily: 'ReemKufi',
  fontSize: 18,
);

class RecipeViewScreen extends StatefulWidget {
  @override
  _RecipeViewScreenState createState() => _RecipeViewScreenState();
}

class _RecipeViewScreenState extends State<RecipeViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: false,
            snap: false,
            floating: true,
            elevation: 2.0,
            expandedHeight: 150.0,
            collapsedHeight: 80.0,
            backgroundColor: CustomColors.blue,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.save),
                color: Colors.white,
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.favorite),
                color: Colors.white,
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.bookmark),
                color: Colors.white,
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.star),
                color: Colors.white,
                onPressed: () {},
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              titlePadding:
                  EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              title: Text(
                'Título de la receta',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  fontFamily: 'ReemKufi',
                  fontSize: 18,
                  shadows: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black87,
                      blurRadius: 2.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                ),
              ),
              background: Hero(
                tag: 'recipe-image-tag',
                child: Image.network(
                  'http://wallpapercrafter.com/uploads/posts/101870-spaghetti_pasta_noodles_food_eat_cook_plate.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  RecipeGeneralInformationView(),
                  RecipeTimeRowView(),
                  ListTile(
                    title: Text(
                      'Información Nutricional',
                      style: TextStyle(
                        fontFamily: 'ReemKufi',
                        color: Colors.black87,
                        fontSize: 18,
                      ),
                    ),
                    contentPadding: EdgeInsets.zero,
                    trailing: Icon(Icons.arrow_right),
                    onTap: () {
                      // TODO: Show nutritional information
                      //_showNutritionalInformation(context);
                    },
                  ),
                  RecipeIngredientsView(),
                  RecipeEquipmentView(),
                  RecipeStepsView(),
                  RecipeTagsView(),
                  RecipeSuggestionsListView()
                ].addBeforeEach(
                  Divider(
                    color: Colors.black38,
                    height: 20.0,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
