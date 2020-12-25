import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/user/user_bloc.dart';
import '../utils/custom_colors.dart';
import '../utils/app_router.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              return PopupMenuButton(
                onSelected: (value) {
                  if (value == '/logout') {
                    BlocProvider.of<UserBloc>(context).add(UserLogOut());
                  } else {
                    Navigator.pushNamed(context, value);
                  }
                },
                offset: Offset(10.0, 5.0),
                itemBuilder: (context) {
                  Map<String, String> routes = <String, String>{};
                  if (state is UserEmpty) {
                    routes.addAll(AppRouter.routesNamedLoggedOut);
                  } else if (state is UserLoaded) {
                    routes.addAll(AppRouter.routesNamedLoggedIn);
                  }

                  return routes.keys
                      .map((key) => PopupMenuItem<String>(
                            value: key,
                            child: Text(routes[key]),
                          ))
                      .toList();
                },
              );
            },
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
