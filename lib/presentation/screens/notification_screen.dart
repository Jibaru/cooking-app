import 'package:flutter/material.dart';

import '../utils/custom_colors.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final Map<String, String> _actions = {
    'delete-viewed': 'Eliminar notificaciones leídas',
    'delete-all': 'Vaciar Todo'
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notificaciones'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (key) {
              // TODO: Handle actions
            },
            offset: Offset(10.0, 5.0),
            itemBuilder: (context) {
              return _actions.keys
                  .map((key) => PopupMenuItem<String>(
                        value: key,
                        child: Text(_actions[key]),
                      ))
                  .toList();
            },
          )
        ],
      ),
      body: NotificationListView(),
    );
  }
}

class NotificationListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return NotificationCard(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return SimpleDialog(
                  title: Text('Título de la notificación'),
                  titleTextStyle: TextStyle(
                    color: Colors.black87,
                    fontFamily: 'ReemKufi',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  children: <Widget>[
                    Text(
                      '17 de Octubre del 2020',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Colors.black54,
                        fontFamily: 'ReemKufi',
                        fontSize: 13,
                      ),
                    ),
                    Divider(
                      indent: 10.0,
                      endIndent: 10.0,
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 14,
                      ),
                    ),
                    Divider(
                      indent: 10.0,
                      endIndent: 10.0,
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}

class NotificationCard extends StatelessWidget {
  final VoidCallback onTap;

  const NotificationCard({
    Key key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
      child: ListTile(
        title: Text(
          'Título de la notificación',
          overflow: TextOverflow.visible,
          style: TextStyle(
            color: Colors.black87,
            fontFamily: 'ReemKufi',
          ),
        ),
        subtitle: Text(
          'Contenido de la notificación que se explica con detenidasda',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.black45,
            fontSize: 13,
            fontFamily: 'ReemKufi',
          ),
        ),
        trailing: Chip(
          backgroundColor: CustomColors.yellow,
          avatar: Icon(
            Icons.new_releases,
            size: 14.0,
          ),
          label: Text('Nuevo'),
          elevation: 2.0,
          labelStyle: TextStyle(
            color: Colors.white,
            fontFamily: 'ReemKufi',
          ),
          clipBehavior: Clip.hardEdge,
        ),
        onTap: onTap,
      ),
    );
  }
}
