import 'package:cooking_app/utilities/custom_colors.dart';
import 'package:flutter/material.dart';

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
        title: Text('Configuración'),
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
          onTap: () {},
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
