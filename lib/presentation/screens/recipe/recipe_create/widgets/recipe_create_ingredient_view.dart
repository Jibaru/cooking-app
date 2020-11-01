import 'package:flutter/material.dart';

import '../../../../utils/custom_colors.dart';
import '../../../../widgets/widgets.dart';
import '../../../ingredient/ingredient_select_screen.dart';

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
