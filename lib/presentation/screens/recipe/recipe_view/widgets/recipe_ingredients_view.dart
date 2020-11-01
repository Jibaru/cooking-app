import 'package:cooking_app/presentation/utils/custom_colors.dart';
import 'package:cooking_app/presentation/widgets/buttons/app_raised_button.dart';
import 'package:flutter/material.dart';

final TextStyle titleTextStyle = const TextStyle(
  color: Colors.black87,
  fontFamily: 'ReemKufi',
  fontSize: 18,
);

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
