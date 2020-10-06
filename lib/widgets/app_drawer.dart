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
                      onTap: () => (Scaffold.of(context) != null)
                          ? Navigator.pop(context)
                          : Navigator.pushNamed(context, '/home'),
                    ),
                    RoutingTileDrawer(
                      title: 'Mis recetas',
                      iconData: Icons.book,
                      // TODO: Redirect to MyRecipesScreen
                      onTap: () {},
                    ),
                    RoutingTileDrawer(
                      title: 'Favoritos',
                      iconData: Icons.favorite,
                      // TODO: Redirect to FavoriteRecipesScreen
                      onTap: () {},
                    ),
                    RoutingTileDrawer(
                      title: 'Guardados',
                      iconData: Icons.bookmark,
                      // TODO: Redirect to StoreRecipesScreen
                      onTap: () {},
                    ),
                    RoutingTileDrawer(
                      title: 'Descargados',
                      iconData: Icons.archive,
                      // TODO: Redirect to DownloadedRecipesScreen
                      onTap: () {},
                    ),
                    RoutingTileDrawer(
                      title: 'Configuración',
                      iconData: Icons.settings,
                      // TODO: Redirect to AppSettingsScreen
                      onTap: () {},
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
