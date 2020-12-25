// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';
import '../data/repositories/repositories.dart';

import './utils/app_theme.dart';
import 'utils/app_router.dart';

class App extends StatelessWidget {
  // final RecipeRepository recipeRepository = ApiRecipeRepository(Dio());
  final UserRepository userRepository = ApiUserRepository();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => userRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          // BlocProvider<AllRecipesBloc>(
          //   create: (context) =>
          //       AllRecipesBloc(apiRecipeRepository: recipeRepository),
          // ),
          BlocProvider<AuthenticationBloc>(
            create: (context) => AuthenticationBloc(userRepository: userRepository),
          ),
          BlocProvider<UserBloc>(
            create: (context) => UserBloc(userRepository: userRepository),
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
