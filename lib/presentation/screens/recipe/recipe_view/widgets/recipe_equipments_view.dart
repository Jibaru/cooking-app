import 'package:flutter/material.dart';

import '../../../../utils/custom_colors.dart';

final TextStyle titleTextStyle = const TextStyle(
  color: Colors.black87,
  fontFamily: 'ReemKufi',
  fontSize: 18,
);

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
