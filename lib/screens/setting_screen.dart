import 'package:cooking_app/utilities/custom_colors.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuración'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            ListTile(
              title: Text('Mantener sesión iniciada al salir de la aplicación'),
              trailing: Switch.adaptive(
                value: true,
                activeColor: CustomColors.blue,
                onChanged: (value) {
                  // TODO: Handle global configuration
                },
              ),
            ),
            Divider(
              color: Colors.black12,
              indent: 15.0,
              endIndent: 15.0,
            ),
            ListTile(
              title: Text('Descargar recetas visitadas automáticamente'),
              trailing: Switch.adaptive(
                value: true,
                activeColor: CustomColors.blue,
                onChanged: (value) {
                  // TODO: Handle global configuration
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
