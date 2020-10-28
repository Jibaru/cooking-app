import 'package:flutter/material.dart';

import 'equipment_create_screen.dart';
import '../../utils/custom_colors.dart';
import '../../widgets/widgets.dart';

class EquipmentSelectScreen extends StatefulWidget {
  @override
  _EquipmentSelectScreenState createState() => _EquipmentSelectScreenState();
}

class _EquipmentSelectScreenState extends State<EquipmentSelectScreen> {
  bool _showSearchBar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seleccionar material'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: <Widget>[
          IconButton(
            icon: _showSearchBar ? Icon(Icons.close) : Icon(Icons.search),
            // TODO: Add function to search equipment
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
                return EquipmentTile(
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
            builder: (context) => EquipmentCreateScreen(),
          ),
        ),
      ),
    );
  }
}

class EquipmentTile extends StatefulWidget {
  const EquipmentTile({
    Key key,
  }) : super(key: key);

  @override
  _EquipmentTileState createState() => _EquipmentTileState();
}

class _EquipmentTileState extends State<EquipmentTile> {
  @override
  Widget build(BuildContext context) {
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
                        'https://electrodomesticosjared.pe/wp-content/uploads/2020/02/LICUADORA-OSTER-BLSTEG7826C-ELECTRODOMESTICOS-JARED-1-1.png',
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
                        // TODO: Select equipment model and returns?
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
                          'Licuadora',
                          style: TextStyle(
                            color: Colors.black87,
                            fontFamily: 'ReemKufi',
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'lorem ipsum  doleron lorem ipsum doleron lorem ipsum doleron lorem ipsum doleron lorem ipsum doleron lorem ipsum doleron lorem ipsum doleron lorem ipsum doleron lorem ipsum doleron lorem ipsum doleron lorem ipsum doleron',
                          maxLines: 5,
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
