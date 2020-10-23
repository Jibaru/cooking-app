import 'package:flutter/material.dart';
import 'package:drop_cap_text/drop_cap_text.dart';

import '../utils/custom_colors.dart';
import '../widgets/widgets.dart';
import '../../extensions/list_extension.dart';

final TextStyle titleTextStyle = const TextStyle(
  color: Colors.black87,
  fontFamily: 'ReemKufi',
  fontSize: 18,
);

class RecipeViewScreen extends StatefulWidget {
  @override
  _RecipeViewScreenState createState() => _RecipeViewScreenState();
}

class _RecipeViewScreenState extends State<RecipeViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: false,
            snap: false,
            floating: true,
            elevation: 2.0,
            expandedHeight: 150.0,
            collapsedHeight: 80.0,
            backgroundColor: CustomColors.blue,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.save),
                color: Colors.white,
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.favorite),
                color: Colors.white,
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.bookmark),
                color: Colors.white,
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.star),
                color: Colors.white,
                onPressed: () {},
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              titlePadding:
                  EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              title: Text(
                'Título de la receta',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  fontFamily: 'ReemKufi',
                  fontSize: 18,
                  shadows: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black87,
                      blurRadius: 2.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                ),
              ),
              background: Hero(
                tag: 'recipe-image-tag',
                child: Image.network(
                  'http://wallpapercrafter.com/uploads/posts/101870-spaghetti_pasta_noodles_food_eat_cook_plate.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  RecipeGeneralInformationView(),
                  RecipeTimeRowView(),
                  ListTile(
                    title: Text(
                      'Información Nutricional',
                      style: TextStyle(
                        fontFamily: 'ReemKufi',
                        color: Colors.black87,
                        fontSize: 18,
                      ),
                    ),
                    contentPadding: EdgeInsets.zero,
                    trailing: Icon(Icons.arrow_right),
                    // TODO: Redirect to Nutritional Information Screen
                    onTap: () {
                      _showNutritionalInformation(context);
                    },
                  ),
                  RecipeIngredientsView(),
                  RecipeEquipmentView(),
                  RecipeStepsView(),
                  RecipeTagsView(),
                  RecipeSuggestionsListView()
                ].addBeforeEach(
                  Divider(
                    color: Colors.black38,
                    height: 20.0,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RecipeGeneralInformationView extends StatelessWidget {
  final TextStyle _style = const TextStyle(
    fontSize: 18,
    color: Colors.black,
    fontFamily: 'ReemKufi',
  );

  const RecipeGeneralInformationView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 6,
          child: Column(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  text: 'Autor: ',
                  style: _style.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                  children: <InlineSpan>[
                    TextSpan(
                      text: 'Andres Calamaro Rodriguez',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              StarRow(
                size: 20.0,
                value: 3.5,
              )
            ],
          ),
        ),
        Expanded(
          flex: 6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                'Postre',
                style: _style.copyWith(
                  fontSize: 16,
                ),
              ),
              Text(
                '5 personas',
                style: _style.copyWith(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class RecipeSuggestionsListView extends StatelessWidget {
  const RecipeSuggestionsListView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          'Recetas Similares',
          style: titleTextStyle,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 220.0,
          child: ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              return GestureDetector(
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => RecipeViewScreen()),
                ),
                child: Container(
                  width: 140.0,
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 0.5,
                          spreadRadius: 0.5)
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.network(
                        'https://i.pinimg.com/736x/a7/0b/43/a70b4366c44a741d2aa603ce48ca972d.jpg',
                        fit: BoxFit.cover,
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Arroz con Pollo a la valeriana con champiñones y pescado',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            maxLines: 4,
                            style: TextStyle(
                              color: Colors.black54,
                              fontFamily: 'ReemKufi',
                              height: 1.0,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

class RecipeTagsView extends StatelessWidget {
  const RecipeTagsView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          'Tags',
          style: titleTextStyle,
        ),
        Wrap(
          spacing: 5,
          runSpacing: -10,
          children: List.generate(
            10,
            (i) => Chip(
              padding: EdgeInsets.zero,
              label: Text('Postre $i'),
              labelStyle: TextStyle(
                color: Colors.white,
                fontFamily: 'ReemKufi',
                fontSize: 15,
              ),
              backgroundColor: CustomColors.yellow,
            ),
          ),
        ),
      ],
    );
  }
}

class RecipeStepsView extends StatelessWidget {
  const RecipeStepsView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          'Instrucciones',
          style: titleTextStyle,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Paso $index',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                      fontFamily: 'ReemKufi',
                    ),
                  ),
                  DropCapText(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
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
                        child: Image.network(
                          'https://i.pinimg.com/736x/a7/0b/43/a70b4366c44a741d2aa603ce48ca972d.jpg',
                        ),
                      ),
                    ),
                    dropCapPosition: DropCapPosition.end,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class RecipeEquipmentView extends StatelessWidget {
  const RecipeEquipmentView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          'Materiales',
          style: titleTextStyle,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: 5,
          itemBuilder: (context, index) {
            return GestureDetector(
              // TODO: Display dialog with ingredient information
              onTap: () {
                _showEquipmentDialog(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 5.0,
                  bottom: 5.0,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.add_box,
                      size: 15,
                      color: CustomColors.blue,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        'Batidora',
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
            );
          },
        ),
      ],
    );
  }

  Future<void> _showEquipmentDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          contentPadding: const EdgeInsets.all(20.0),
          children: <Widget>[
            SizedBox(
              height: 200,
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/img/img_loader.gif',
                image:
                    'https://oechsle.vteximg.com.br/arquivos/ids/163693-1000-1000/Oster-Licuadora-BLSTEG7890R-3-Velocidades-1.5L-Rojo-875896_2.jpg?v=636082470031330000',
              ),
            ),
            /*FadeInImage(
              placeholder: AssetImage('assets/img/img_loader.gif'),
              image: MemoryImage(base64Decode(
                  'base64image')),
            ),*/
            Text(
              'Licuadora',
              style: titleTextStyle,
            ),
            Text(
              'Solanum lycopersicum, cuyo fruto es el tomate, conocida comúnmente como tomatera, es una especie de planta herbácea del género Solanum de la familia Solanaceae; es nativa de América Central y México, del norte y noroeste de Sudamérica; su uso como comida se habría originado en Sudamérica hace 2600 años',
            ),
          ],
        );
      },
    );
  }
}

class RecipeIngredientsView extends StatelessWidget {
  const RecipeIngredientsView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          'Ingredientes',
          style: titleTextStyle,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: 5,
          itemBuilder: (context, index) {
            return GestureDetector(
              // TODO: Display dialog with ingredient information
              onTap: () {
                _showIngredientDialog(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 5.0,
                  bottom: 5.0,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
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
                        '1 kg Arroz',
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
            );
          },
        ),
      ],
    );
  }

  Future<void> _showIngredientDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          contentPadding: const EdgeInsets.all(20.0),
          children: <Widget>[
            SizedBox(
              height: 200,
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/img/img_loader.gif',
                image:
                    'https://images.clarin.com/2013/11/04/ByxTXbShml_340x340.jpg',
              ),
            ),
            /*FadeInImage(
              placeholder: AssetImage('assets/img/img_loader.gif'),
              image: MemoryImage(base64Decode(
                  'base64image')),
            ),*/
            Text(
              'Tomate',
              style: titleTextStyle,
            ),
            Text(
              'Solanum lycopersicum, cuyo fruto es el tomate, conocida comúnmente como tomatera, es una especie de planta herbácea del género Solanum de la familia Solanaceae; es nativa de América Central y México, del norte y noroeste de Sudamérica; su uso como comida se habría originado en Sudamérica hace 2600 años',
            ),
            SizedBox(
              height: 20,
            ),
            AppRaisedButton(
              text: 'Información Nutricional',
              onPressed: () {
                // TODO: Redirect to Nutritional Information Screen
                _showNutritionalInformation(context);
              },
            )
          ],
        );
      },
    );
  }
}

class RecipeTimeRowView extends StatelessWidget {
  const RecipeTimeRowView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          width: (MediaQuery.of(context).size.width - 30.0) * 0.33,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.timer),
              Text('Tiempo Prep.'),
              Text('20 min'),
            ],
          ),
        ),
        Container(
          width: (MediaQuery.of(context).size.width - 30.0) * 0.33,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Tiempo Total'),
              Text('1h 15 min'),
            ],
          ),
        ),
        Container(
          width: (MediaQuery.of(context).size.width - 30.0) * 0.33,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.timer),
              Text('Tiempo Coc.'),
              Text('20 min'),
            ],
          ),
        )
      ],
    );
  }
}

Future<void> _showNutritionalInformation(BuildContext context) {
  final EdgeInsetsGeometry tableCellsPadding = const EdgeInsets.symmetric(
    horizontal: 10.0,
    vertical: 5.0,
  );

  List<TableRow> tableRows() {
    final tableRowList = [
      TableRow(
        children: <Widget>[
          TableCell(
            child: Padding(
              padding: tableCellsPadding,
              child: Text('Nutriente'),
            ),
          ),
          TableCell(
            child: Padding(
              padding: tableCellsPadding,
              child: Text('Cantidad'),
            ),
          ),
          TableCell(
            child: Padding(
              padding: tableCellsPadding,
              child: Text('Unidades'),
            ),
          ),
        ],
      ),
    ];

    tableRowList.addAll(
      List.generate(
        10,
        (index) => TableRow(
          children: <Widget>[
            TableCell(
              child: Padding(
                padding: tableCellsPadding,
                child: Text('Calcio'),
              ),
            ),
            TableCell(
              child: Padding(
                padding: tableCellsPadding,
                child: Text('${index * 0.5}'),
              ),
            ),
            TableCell(
              child: Padding(
                padding: tableCellsPadding,
                child: Text('gr'),
              ),
            ),
          ],
        ),
      ),
    );

    return tableRowList;
  }

  return showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      contentPadding: const EdgeInsets.all(20.0),
      children: [
        Table(
          border: TableBorder.all(
            color: Colors.black26,
            width: 2,
          ),
          children: tableRows(),
        ),
      ],
    ),
  );
}
