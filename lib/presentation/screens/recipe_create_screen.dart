import 'package:drop_cap_text/drop_cap_text.dart';
import 'package:flutter/material.dart';

import 'equipment/equipment_select_screen.dart';
import 'ingredient/ingredient_select_screen.dart';
import '../utils/custom_colors.dart';
import '../widgets/widgets.dart';
import '../screens/step_create_screen.dart';

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

class RecipeTagCreateDialog extends StatefulWidget {
  final Set<String> initialTags;
  final void Function(String) onTagAdded;
  final void Function(String) onTagDeleted;

  const RecipeTagCreateDialog({
    Key key,
    this.initialTags,
    this.onTagAdded,
    this.onTagDeleted,
  }) : super(key: key);

  @override
  _RecipeTagCreateDialogState createState() => _RecipeTagCreateDialogState();
}

class _RecipeTagCreateDialogState extends State<RecipeTagCreateDialog> {
  final TextEditingController _nameTagTextEditingController =
      TextEditingController();
  final Set<String> _currentTags = <String>{};

  @override
  void initState() {
    if (widget.initialTags != null) {
      _currentTags.addAll(widget.initialTags);
    }
    super.initState();
  }

  @override
  void dispose() {
    _nameTagTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: const EdgeInsets.all(20.0),
      children: <Widget>[
        Text(
          'Tags',
          style: TextStyle(
            fontFamily: 'ReemKufi',
            color: Colors.black54,
            fontSize: 15,
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: AppTextFormField(
                controller: _nameTagTextEditingController,
                labelText: 'Nombre del Tag',
                prefixIconData: Icons.tag_faces,
              ),
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  _currentTags.add(_nameTagTextEditingController.text);
                });
                widget.onTagAdded?.call(_nameTagTextEditingController.text);
              },
            ),
          ],
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
            child: SingleChildScrollView(
              child: Wrap(
                spacing: 10.0,
                children: _currentTags
                    .toList()
                    .reversed
                    .map(
                      (tagItem) => Chip(
                        label: Text('$tagItem'),
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontFamily: 'ReemKufi',
                          fontSize: 15,
                        ),
                        deleteIcon: Icon(Icons.close),
                        deleteIconColor: Colors.white,
                        backgroundColor: CustomColors.yellow,
                        onDeleted: () {
                          setState(() {
                            _currentTags.remove(tagItem);
                          });
                          widget.onTagDeleted?.call(tagItem);
                        },
                      ),
                    )
                    .toList()
                    .cast<Widget>(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class RecipeCuisineSelectDialog extends StatefulWidget {
  final void Function(String) onSelect;

  const RecipeCuisineSelectDialog({
    Key key,
    this.onSelect,
  }) : super(key: key);

  @override
  _RecipeCusineSelectDialogState createState() =>
      _RecipeCusineSelectDialogState();
}

class _RecipeCusineSelectDialogState extends State<RecipeCuisineSelectDialog> {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: const EdgeInsets.all(20.0),
      children: <Widget>[
        Text(
          'Tipo de cocina',
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
              itemCount: 25,
              padding: EdgeInsets.zero,
              itemBuilder: (context, i) {
                return ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  leading: Icon(Icons.indeterminate_check_box),
                  title: Text(
                    'Americana $i',
                    style: TextStyle(
                      fontFamily: 'ReemKufi',
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {
                    widget.onSelect?.call('Americana $i');
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

class RecipeTypeSelectDialog extends StatefulWidget {
  final void Function(String) onSelect;

  const RecipeTypeSelectDialog({
    Key key,
    this.onSelect,
  }) : super(key: key);

  @override
  _RecipeTypeSelectDialogState createState() => _RecipeTypeSelectDialogState();
}

class _RecipeTypeSelectDialogState extends State<RecipeTypeSelectDialog> {
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

class RecipeCreateInstructionView extends StatelessWidget {
  const RecipeCreateInstructionView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Instrucciones',
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StepCreateScreen(),
                  ),
                );
              },
            )
          ],
        ),
        ListView.builder(
          itemCount: 2,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, i) {
            return StepOptionRow(
              margin: EdgeInsets.only(bottom: 10.0),
            );
          },
        )
      ],
    );
  }
}

class RecipeCreateEquipmentView extends StatelessWidget {
  const RecipeCreateEquipmentView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Materiales',
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EquipmentSelectScreen(),
                  ),
                );
              },
            )
          ],
        ),
        ListView.builder(
          itemCount: 1,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, i) {
            return EquipmentOptionRow();
          },
        )
      ],
    );
  }
}

class RecipeCreateIngredientView extends StatelessWidget {
  const RecipeCreateIngredientView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Ingredientes',
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => IngredientSelectScreen(),
                  ),
                );
              },
            )
          ],
        ),
        ListView.builder(
          itemCount: 1,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, i) {
            return IngredientOptionRow();
          },
        )
      ],
    );
  }
}

class IngredientOptionRow extends StatelessWidget {
  const IngredientOptionRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_box,
                size: 15,
                color: CustomColors.blue,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  '14 kg Azúcar',
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                    color: Colors.black87,
                    fontFamily: 'ReemKufi',
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FlatButton.icon(
              color: CustomColors.yellow,
              textColor: Colors.white,
              icon: Icon(Icons.edit),
              label: Text(
                'Cant.',
                style: TextStyle(fontFamily: 'ReemKufi'),
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Establezca la cantidad y unidades',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18,
                              fontFamily: 'ReemKufi',
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              NaturalNumberSelectButton(
                                initialNumber: 1,
                                min: 1,
                                max: 99,
                                onChange: (value) {
                                  // TODO: Change values
                                },
                              ),
                              SizedBox(
                                width: 120.0,
                                child: ListSelectButton(
                                  list: ['kg', 'gr', 'tazas'],
                                  onChange: (value) {
                                    // TODO: change values
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
            SizedBox(
              width: 5.0,
            ),
            FlatButton.icon(
              color: Colors.red,
              textColor: Colors.white,
              icon: Icon(Icons.delete_forever),
              label: Text(
                'Remover',
                style: TextStyle(fontFamily: 'ReemKufi'),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}

class EquipmentOptionRow extends StatelessWidget {
  const EquipmentOptionRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_box,
                size: 15,
                color: CustomColors.blue,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  'Licuadora',
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                    color: Colors.black87,
                    fontFamily: 'ReemKufi',
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
        FlatButton.icon(
          color: Colors.red,
          textColor: Colors.white,
          icon: Icon(Icons.delete_forever),
          label: Text(
            'Remover',
            style: TextStyle(fontFamily: 'ReemKufi'),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}

class StepOptionRow extends StatelessWidget {
  final EdgeInsets margin;

  const StepOptionRow({
    Key key,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Paso 1',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontFamily: 'ReemKufi',
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FlatButton.icon(
                          color: CustomColors.yellow,
                          textColor: Colors.white,
                          icon: Icon(Icons.edit),
                          label: Text(
                            'Editar',
                            style: TextStyle(fontFamily: 'ReemKufi'),
                          ),
                          onPressed: () {},
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        FlatButton.icon(
                          color: Colors.red,
                          textColor: Colors.white,
                          icon: Icon(Icons.delete_forever),
                          label: Text(
                            'Remover',
                            style: TextStyle(fontFamily: 'ReemKufi'),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
                DropCapText(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black54,
                    fontFamily: 'ReemKufi',
                    height: 1.4,
                  ),
                  dropCap: DropCap(
                    height: 100.0,
                    width: 100.0,
                    child: GestureDetector(
                      // TODO: Open modal to view image
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return SimpleDialog(
                              contentPadding: const EdgeInsets.all(20.0),
                              children: <Widget>[
                                FadeInImage.assetNetwork(
                                  placeholder: 'assets/img/img_loader.gif',
                                  image:
                                      'https://i.pinimg.com/736x/a7/0b/43/a70b4366c44a741d2aa603ce48ca972d.jpg',
                                ),
                                /*FadeInImage(
                                    placeholder: AssetImage('assets/img/img_loader.gif'),
                                    image: MemoryImage(base64Decode(
                                        'base64image')),
                                  ),*/
                              ],
                            );
                          },
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Image.network(
                          'https://i.pinimg.com/736x/a7/0b/43/a70b4366c44a741d2aa603ce48ca972d.jpg',
                        ),
                      ),
                    ),
                  ),
                  dropCapPosition: DropCapPosition.end,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
