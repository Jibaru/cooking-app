import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/user/user_bloc.dart';
import '../../../presentation/utils/app_router.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 1,
                    spreadRadius: 1,
                    offset: Offset(0.0, -1.0),
                  )
                ],
              ),
              child: BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is UserLoaded) {
                    return GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/profile'),
                      child: Column(
                        children: [
                          if (state.user.image != null)
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: Image.memory(
                                    state.user?.image?.uint8listBase64,
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          if (state.user.image == null)
                            CircleAvatar(
                              backgroundColor: Colors.black26,
                              foregroundColor: Colors.black54,
                              radius: 45,
                              child: Icon(
                                Icons.person,
                                size: 30,
                              ),
                            ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            state.user.fullName,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 15, fontFamily: 'ReemKufi'),
                          ),
                        ],
                      ),
                    );
                  }

                  return Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.black26,
                        foregroundColor: Colors.black54,
                        radius: 45,
                        child: Icon(
                          Icons.person,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () => Navigator.pushNamed(context, '/login'),
                        child: Text(
                          'Ingresar',
                          style:
                              TextStyle(fontSize: 18, fontFamily: 'ReemKufi'),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.zero,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    RoutingTileDrawer(
                      title: 'Inicio',
                      iconData: Icons.home,
                      onTap: () {
                        if (AppRouter.isCurrent(context, '/home')) {
                          Navigator.pop(context);
                        } else {
                          Navigator.pushNamed(context, '/home');
                        }
                      },
                      /*onTap: () => (Scaffold.of(context) != null)
                          ? Navigator.pop(context)
                          : Navigator.pushNamed(context, '/home'),*/
                    ),
                    BlocBuilder<UserBloc, UserState>(
                      builder: (context, state) {
                        return Visibility(
                          visible: state is UserLoaded,
                          child: RoutingTileDrawer(
                            title: 'Mis recetas',
                            iconData: Icons.book,
                            onTap: () => AppRouter.isCurrent(context, '/my-recipes')
                                ? Navigator.pop(context)
                                : Navigator.pushReplacementNamed(
                                    context,
                                    '/my-recipes',
                                  ),
                          ),
                        );
                      },
                    ),
                    BlocBuilder<UserBloc, UserState>(
                      builder: (context, state) {
                        return Visibility(
                          visible: state is UserLoaded,
                          child: RoutingTileDrawer(
                            title: 'Favoritos',
                            iconData: Icons.favorite,
                            onTap: () =>
                                AppRouter.isCurrent(context, '/favorite-recipes')
                                    ? Navigator.pop(context)
                                    : Navigator.pushReplacementNamed(
                                        context,
                                        '/favorite-recipes',
                                      ),
                          ),
                        );
                      },
                    ),
                    BlocBuilder<UserBloc, UserState>(
                      builder: (context, state) {
                        return Visibility(
                          visible: state is UserLoaded,
                          child: RoutingTileDrawer(
                            title: 'Guardados',
                            iconData: Icons.bookmark,
                            onTap: () =>
                                AppRouter.isCurrent(context, '/stored-recipes')
                                    ? Navigator.pop(context)
                                    : Navigator.pushReplacementNamed(
                                        context,
                                        '/stored-recipes',
                                      ),
                          ),
                        );
                      },
                    ),
                    RoutingTileDrawer(
                      title: 'Descargados',
                      iconData: Icons.archive,
                      onTap: () =>
                          AppRouter.isCurrent(context, '/downloaded-recipes')
                              ? Navigator.pop(context)
                              : Navigator.pushReplacementNamed(
                                  context,
                                  '/downloaded-recipes',
                                ),
                    ),
                    RoutingTileDrawer(
                      title: 'Configuración',
                      iconData: Icons.settings,
                      onTap: () => Navigator.pushNamed(context, '/setting'),
                    ),
                    BlocBuilder<UserBloc, UserState>(
                      builder: (context, state) {
                        return Visibility(
                          visible: state is UserLoaded,
                          child: RoutingTileDrawer(
                            title: 'Cerrar sesión',
                            iconData: Icons.logout,
                            onTap: () {
                              BlocProvider.of<UserBloc>(context)
                                  .add(UserLogOut());
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RoutingTileDrawer extends StatelessWidget {
  final String title;
  final IconData iconData;
  final VoidCallback onTap;

  RoutingTileDrawer({
    @required this.title,
    @required this.iconData,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontFamily: 'ReemKufi',
          color: Colors.black87,
        ),
      ),
      leading: Icon(
        iconData,
        color: Colors.black45,
      ),
      trailing: Icon(
        Icons.arrow_right,
        color: Colors.black26,
      ),
      onTap: onTap,
    );
  }
}
