import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class EquipmentCreateScreen extends StatefulWidget {
  @override
  _EquipmentCreateScreenState createState() => _EquipmentCreateScreenState();
}

class _EquipmentCreateScreenState extends State<EquipmentCreateScreen> {
  TextEditingController _equipmentNameTextEditingController =
      TextEditingController();
  TextEditingController _equipmentDescriptionTextEditingController =
      TextEditingController();

  @override
  void dispose() {
    _equipmentNameTextEditingController.dispose();
    _equipmentDescriptionTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Material'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            // TODO: Add function to save recipe
            onPressed: () => {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          AppImageViewSelect(),
          AppTextFormField(
            controller: _equipmentNameTextEditingController,
            labelText: 'Nombre del material',
            textInputAction: TextInputAction.done,
          ),
          AppTextFormField(
            controller: _equipmentDescriptionTextEditingController,
            labelText: 'Descripción',
            textInputAction: TextInputAction.done,
          ),
        ],
      ),
    );
  }
}
