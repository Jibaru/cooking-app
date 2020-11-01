import 'package:flutter/material.dart';

import '../../../../utils/custom_colors.dart';
import '../../../equipment/equipment_select_screen.dart';

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
