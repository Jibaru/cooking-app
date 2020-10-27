import 'package:flutter/material.dart';

import '../nutritional_information_create_screen.dart';
import '../../widgets/widgets.dart';

class IngredientCreateScreen extends StatefulWidget {
  @override
  _IngredientCreateScreenState createState() => _IngredientCreateScreenState();
}

class _IngredientCreateScreenState extends State<IngredientCreateScreen> {
  TextEditingController _ingredientNameTextEditingController =
      TextEditingController();
  TextEditingController _ingredientDescriptionTextEditingController =
      TextEditingController();
  TextEditingController _ingredientCategoryTextEditingController =
      TextEditingController();
  TextEditingController _amountValueTextEditingController =
      TextEditingController();
  TextEditingController _amoungUnitsTextEditingController =
      TextEditingController();

  @override
  void dispose() {
    _ingredientNameTextEditingController.dispose();
    _ingredientDescriptionTextEditingController.dispose();
    _ingredientCategoryTextEditingController.dispose();
    _amountValueTextEditingController.dispose();
    _amoungUnitsTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Ingrediente'),
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
            controller: _ingredientNameTextEditingController,
            labelText: 'Nombre del ingrediente',
            textInputAction: TextInputAction.done,
          ),
          AppTextFormField(
            controller: _ingredientDescriptionTextEditingController,
            labelText: 'Descripción',
            textInputAction: TextInputAction.done,
          ),
          AppTextFieldDialog(
            controller: _ingredientCategoryTextEditingController,
            labelText: 'Categoría',
            prefixIconData: Icons.fastfood,
            suffixIconData: Icons.search,
            builder: (context) {
              return IngredientCategorySelectDialog(
                onSelect: (value) {
                  setState(() {
                    _ingredientCategoryTextEditingController.text = value;
                  });
                },
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: AppNumberSelect(
                  controller: _amountValueTextEditingController,
                  labelText: 'Cantidad',
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: AppDropdown(
                  controller: _amoungUnitsTextEditingController,
                  list: ['kg', 'gr', 'litros', 'unidades'],
                  labelText: 'Unidad',
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25.0,
          ),
          AppRaisedButton(
            text: 'Agregar información nutricional',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NutritionalInformationCreateScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class IngredientCategorySelectDialog extends StatefulWidget {
  final void Function(String) onSelect;

  const IngredientCategorySelectDialog({
    Key key,
    this.onSelect,
  }) : super(key: key);

  @override
  _IngredientCategorySelectDialogState createState() =>
      _IngredientCategorySelectDialogState();
}

class _IngredientCategorySelectDialogState
    extends State<IngredientCategorySelectDialog> {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: const EdgeInsets.all(20.0),
      children: <Widget>[
        Text(
          'Tipo de receta',
          style: TextStyle(
            fontFamily: 'ReemKufi',
            color: Colors.black54,
            fontSize: 15,
          ),
        ),
        AppTextFormField(
          prefixIconData: Icons.search,
        ),
        Container(
          height: 300.0,
          margin: const EdgeInsets.only(top: 10.0),
          width: double.maxFinite,
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowGlow();
              return;
            },
            child: ListView.builder(
              itemCount: 10,
              padding: EdgeInsets.zero,
              itemBuilder: (context, i) {
                return ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  leading: Icon(Icons.indeterminate_check_box),
                  title: Text(
                    'Entrada $i',
                    style: TextStyle(
                      fontFamily: 'ReemKufi',
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {
                    widget.onSelect?.call('Entrada $i');
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
