import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class StepCreateScreen extends StatefulWidget {
  @override
  _StepCreateScreenState createState() => _StepCreateScreenState();
}

class _StepCreateScreenState extends State<StepCreateScreen> {
  TextEditingController _stepContentTextEditingController =
      TextEditingController();

  @override
  void dispose() {
    _stepContentTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Paso'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            // TODO: Add function to return step?
            onPressed: () => {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          AppImageViewSelect(),
          AppTextFormField(
            controller: _stepContentTextEditingController,
            labelText: 'Contenido',
            textInputAction: TextInputAction.done,
          ),
        ],
      ),
    );
  }
}
