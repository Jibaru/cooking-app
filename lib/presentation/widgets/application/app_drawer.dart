import 'package:cooking_app/presentation/utils/router.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
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
              child: Column(
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
                      style: TextStyle(fontSize: 18, fontFamily: 'ReemKufi'),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.zero,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <RoutingTileDrawer>[
                    RoutingTileDrawer(
                      title: 'Inicio',
                      iconData: Icons.home,
                      onTap: () {
                        if (Router.isCurrent(context, '/home')) {
                          Navigator.pop(context);
                        } else {
                          Navigator.pushNamed(context, '/home');
                        }
                      },
                      /*onTap: () => (Scaffold.of(context) != null)
                          ? Navigator.pop(context)
                          : Navigator.pushNamed(context, '/home'),*/
                    ),
                    RoutingTileDrawer(
                      title: 'Mis recetas',
                      iconData: Icons.book,
                      onTap: () => Router.isCurrent(context, '/my-recipes')
                          ? Navigator.pop(context)
                          : Navigator.pushReplacementNamed(
                              context,
                              '/my-recipes',
                            ),
                    ),
                    RoutingTileDrawer(
                      title: 'Favoritos',
                      iconData: Icons.favorite,
                      onTap: () =>
                          Router.isCurrent(context, '/favorite-recipes')
                              ? Navigator.pop(context)
                              : Navigator.pushReplacementNamed(
                                  context,
                                  '/favorite-recipes',
                                ),
                    ),
                    RoutingTileDrawer(
                      title: 'Guardados',
                      iconData: Icons.bookmark,
                      onTap: () => Router.isCurrent(context, '/stored-recipes')
                          ? Navigator.pop(context)
                          : Navigator.pushReplacementNamed(
                              context,
                              '/stored-recipes',
                            ),
                    ),
                    RoutingTileDrawer(
                      title: 'Descargados',
                      iconData: Icons.archive,
                      onTap: () =>
                          Router.isCurrent(context, '/downloaded-recipes')
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
