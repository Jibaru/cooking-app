import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/all_recipes/all_recipes_bloc.dart';
import '../data/repositories/recipe/recipe_repository.dart';
import '../data/repositories/recipe/api_recipe_repository.dart';

import './utils/app_theme.dart';
import 'utils/app_router.dart';

class App extends StatelessWidget {
  final RecipeRepository recipeRepository = ApiRecipeRepository(Dio());

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => recipeRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AllRecipesBloc>(
            create: (context) =>
                AllRecipesBloc(apiRecipeRepository: recipeRepository),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Theme.of(context).copyWith(
            appBarTheme: AppTheme.appBarTheme(context),
            floatingActionButtonTheme:
                AppTheme.floatingActionButtonTheme(context),
          ),
          title: 'Cooking App',
          routes: AppRouter.routes,
          initialRoute: '/home',
          //onUnknownRoute: _router.unknownRouteSolver,
        ),
      ),
    );
  }
}
