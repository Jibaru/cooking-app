import 'package:flutter/material.dart';

import 'ingredient_create_screen.dart';
import '../../utils/custom_colors.dart';
import '../../widgets/widgets.dart';

class IngredientSelectScreen extends StatefulWidget {
  @override
  _IngredientSelectScreenState createState() => _IngredientSelectScreenState();
}

class _IngredientSelectScreenState extends State<IngredientSelectScreen> {
  bool _showSearchBar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seleccionar ingrediente'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: <Widget>[
          IconButton(
            icon: _showSearchBar ? Icon(Icons.close) : Icon(Icons.search),
            // TODO: Add function to search ingredient
            onPressed: () {
              setState(() {
                _showSearchBar = !_showSearchBar;
              });
            },
          ),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_showSearchBar)
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60.0,
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              margin: EdgeInsets.only(bottom: 1.5),
              decoration:
                  BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(1.0, 1.0),
                    spreadRadius: 1.0,
                    blurRadius: 2.0)
              ]),
              child: AppTextFormField(
                prefixIconData: Icons.search,
              ),
            ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(15.0),
              itemCount: 5,
              itemBuilder: (context, i) {
                return IngredientTile(
                  key: UniqueKey(),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: CustomColors.blue,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => IngredientCreateScreen(),
          ),
        ),
      ),
    );
  }
}

class IngredientTile extends StatefulWidget {
  const IngredientTile({
    Key key,
  }) : super(key: key);

  @override
  _IngredientTileState createState() => _IngredientTileState();
}

class _IngredientTileState extends State<IngredientTile>
    with AutomaticKeepAliveClientMixin {
  int _value = 1;
  String _units = 'unidad';

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150.0,
      child: Card(
        color: Colors.white,
        elevation: 1.0,
        shape: Border.all(
          style: BorderStyle.solid,
          width: 0.2,
          color: Colors.black45,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Container(
                width: 120.0,
                height: 120.0,
                child: Stack(
                  children: <Widget>[
                    FadeInImage(
                      placeholder: AssetImage('assets/img/img_loader.gif'),
                      image: NetworkImage(
                        'https://img.vixdata.io/pd/jpg-large/es/sites/default/files/imj/vivirsalud/B/Beneficios-del-tomate-un-super-alimento-4.jpg',
                      ),
                      width: 120.0,
                      height: 120.0,
                    ),
                    FloatingActionButton(
                      mini: true,
                      heroTag: UniqueKey(),
                      backgroundColor: Colors.green,
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        // TODO: Select iingredient model and returns?
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Tomate',
                          style: TextStyle(
                            color: Colors.black87,
                            fontFamily: 'ReemKufi',
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'lorem ipsum  doleron lorem ipsum doleron lorem ipsum doleron lorem ipsum doleron lorem ipsum doleron lorem ipsum doleron lorem ipsum doleron lorem ipsum doleron lorem ipsum doleron lorem ipsum doleron lorem ipsum doleron',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'ReemKufi',
                            fontSize: 15,
                            height: 1.0,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '$_value $_units',
                          style: TextStyle(
                            fontFamily: 'ReemKufi',
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        FlatButton.icon(
                          onPressed: () {
                            // TODO: Open modal to change units and value
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  padding: const EdgeInsets.only(
                                      top: 20.0, bottom: 10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          NaturalNumberSelectButton(
                                            initialNumber: _value,
                                            min: 1,
                                            max: 99,
                                            onChange: (value) {
                                              setState(() {
                                                _value = value;
                                              });
                                            },
                                          ),
                                          SizedBox(
                                            width: 120.0,
                                            child: ListSelectButton(
                                              list: ['kg', 'gr', 'tazas'],
                                              onChange: (value) {
                                                setState(() {
                                                  _units = value;
                                                });
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
                          padding:
                              const EdgeInsets.fromLTRB(5.0, 5.0, 10.0, 5.0),
                          icon: Icon(
                            Icons.edit,
                            size: 15,
                          ),
                          color: CustomColors.yellow,
                          textColor: Colors.white,
                          label: Text(
                            'Cambiar cantidad',
                            style: TextStyle(
                              fontFamily: 'ReemKufi',
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
