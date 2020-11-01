import 'package:flutter/material.dart';

import './widgets/recipe_tag_create_dialog.dart';
import './widgets/recipe_cuisine_select_dialog.dart';
import './widgets/recipe_type_select_dialog.dart';
import './widgets/recipe_create_instruction_view.dart';
import './widgets/recipe_create_equipment_view.dart';
import './widgets/recipe_create_ingredient_view.dart';

import '../../../utils/custom_colors.dart';
import '../../../widgets/widgets.dart';

class RecipeCreateScreen extends StatefulWidget {
  @override
  _RecipeCreateScreenState createState() => _RecipeCreateScreenState();
}

class _RecipeCreateScreenState extends State<RecipeCreateScreen> {
  final TextEditingController _recipeTitleTextEditingController =
      TextEditingController();
  final TextEditingController _recipeTypeTextEditingController =
      TextEditingController();
  final TextEditingController _recipeCuisineTextEditingController =
      TextEditingController();
  final TextEditingController _recipeDescriptionTextEditingController =
      TextEditingController();
  final TextEditingController _recipeYieldTextEditingController =
      TextEditingController();

  final FocusNode _recipeTypeFocusNode = FocusNode();
  final FocusNode _recipeCuisineFocusNode = FocusNode();
  final FocusNode _recipeDescriptionFocusNode = FocusNode();

  final Set<String> _tags = <String>{};

  @override
  void dispose() {
    _recipeTitleTextEditingController.dispose();
    _recipeTypeTextEditingController.dispose();
    _recipeCuisineTextEditingController.dispose();
    _recipeDescriptionTextEditingController.dispose();
    _recipeYieldTextEditingController.dispose();

    _recipeTypeFocusNode.dispose();
    _recipeCuisineFocusNode.dispose();
    _recipeDescriptionFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Receta'),
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
            controller: _recipeTitleTextEditingController,
            labelText: 'Nombre de la receta',
            textInputAction: TextInputAction.done,
          ),
          AppTextFieldDialog(
            controller: _recipeTypeTextEditingController,
            focusNode: _recipeTypeFocusNode,
            labelText: 'Tipo',
            prefixIconData: Icons.fastfood,
            suffixIconData: Icons.search,
            builder: (context) {
              return RecipeTypeSelectDialog(
                onSelect: (recipeType) {
                  setState(() {
                    _recipeTypeTextEditingController.text = recipeType;
                  });
                },
              );
            },
          ),
          AppTextFieldDialog(
            controller: _recipeCuisineTextEditingController,
            focusNode: _recipeCuisineFocusNode,
            labelText: 'Cocina',
            prefixIconData: Icons.collections_bookmark,
            suffixIconData: Icons.search,
            builder: (context) {
              return RecipeCuisineSelectDialog(
                onSelect: (recipeCuisine) {
                  setState(() {
                    _recipeCuisineTextEditingController.text = recipeCuisine;
                  });
                },
              );
            },
          ),
          AppNumberSelect(
            controller: _recipeYieldTextEditingController,
            labelText: 'Cantidad de personas',
            prefixIconData: Icons.people,
          ),
          AppTextFormField(
            controller: _recipeDescriptionTextEditingController,
            focusNode: _recipeDescriptionFocusNode,
            labelText: 'Descripción Breve',
            prefixIconData: Icons.book,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: AppTimeSelect(
                    label: 'Tiempo de preparación',
                    onChanged: (value) {
                      // TODO: Store value
                      print(value);
                    },
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: AppTimeSelect(
                    label: 'Tiempo de cocción',
                    onChanged: (value) {
                      // TODO: Store value
                    },
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          RecipeCreateIngredientView(),
          Divider(
            color: Colors.black38,
            height: 20.0,
          ),
          RecipeCreateEquipmentView(),
          Divider(
            color: Colors.black38,
            height: 20.0,
          ),
          RecipeCreateInstructionView(),
          Divider(
            color: Colors.black38,
            height: 20.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tags',
                    style: TextStyle(
                      color: Colors.black87,
                      fontFamily: 'ReemKufi',
                      fontSize: 18,
                    ),
                  ),
                  FlatButton.icon(
                    color: CustomColors.blue,
                    textColor: Colors.white,
                    icon: Icon(Icons.add),
                    label: Text(
                      'Agregar',
                      style: TextStyle(fontFamily: 'ReemKufi'),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => RecipeTagCreateDialog(
                          initialTags: _tags,
                          onTagAdded: (tagItem) {
                            setState(() {
                              _tags.add(tagItem);
                            });
                          },
                          onTagDeleted: (tagItem) {
                            setState(() {
                              _tags.remove(tagItem);
                            });
                          },
                        ),
                      );
                    },
                  )
                ],
              ),
              Wrap(
                spacing: 5,
                runSpacing: -10,
                children: _tags
                    .map(
                      (tagItem) => Chip(
                        padding: EdgeInsets.zero,
                        label: Text('$tagItem'),
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontFamily: 'ReemKufi',
                          fontSize: 15,
                        ),
                        deleteIcon: Icon(Icons.close),
                        deleteIconColor: Colors.white,
                        onDeleted: () {
                          // TODO: Remove Tag from the list
                          setState(() {
                            _tags.remove(tagItem);
                          });
                        },
                        backgroundColor: CustomColors.yellow,
                      ),
                    )
                    .toList()
                    .cast<Widget>(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
