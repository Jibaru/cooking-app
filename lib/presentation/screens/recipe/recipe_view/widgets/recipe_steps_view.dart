import 'package:flutter/material.dart';
import 'package:drop_cap_text/drop_cap_text.dart';

final TextStyle titleTextStyle = const TextStyle(
  color: Colors.black87,
  fontFamily: 'ReemKufi',
  fontSize: 18,
);

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
