import 'package:flutter/material.dart';
import 'package:drop_cap_text/drop_cap_text.dart';

import '../../../../utils/custom_colors.dart';
import '../../../step_create_screen.dart';

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
