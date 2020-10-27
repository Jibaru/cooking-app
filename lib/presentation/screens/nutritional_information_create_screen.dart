import 'package:flutter/material.dart';

import '../utils/custom_colors.dart';
import '../widgets/widgets.dart';

class NutritionalInformationCreateScreen extends StatefulWidget {
  @override
  _NutritionalInformationCreateScreenState createState() =>
      _NutritionalInformationCreateScreenState();
}

class _NutritionalInformationCreateScreenState
    extends State<NutritionalInformationCreateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Información Nutricional'),
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
          Container(
            height: 230.0,
            child: Stack(
              children: <Widget>[
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        AppDropdown(
                          list: ['Calcio', 'Proteínas', 'Zinc', 'Vitamina A'],
                          labelText: 'Nutriente',
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: AppNumberSelect(
                                controller: TextEditingController(),
                                labelText: 'Cantidad',
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                              child: AppDropdown(
                                list: ['gramos', 'miligramos', 'unidades'],
                                labelText: 'Unidad',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  right: 10.0,
                  child: FloatingActionButton(
                    heroTag: UniqueKey(),
                    child: Icon(Icons.add),
                    onPressed: () {},
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  right: 10.0,
                  child: FloatingActionButton(
                    heroTag: UniqueKey(),
                    backgroundColor: Colors.red,
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  right: 80.0,
                  child: FloatingActionButton(
                    heroTag: UniqueKey(),
                    backgroundColor: CustomColors.yellow,
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: NutritionalInformationTable(
                    nutritionalInformations: [1, 2, 3, 4],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NutritionalInformationTable extends StatelessWidget {
  final List nutritionalInformations;
  final EdgeInsetsGeometry _tableRowPadding = const EdgeInsets.all(5.0);
  final TextStyle _tableRowTextStyle = const TextStyle(
    color: Colors.black87,
    fontFamily: 'ReemKufi',
    fontSize: 14,
  );
  const NutritionalInformationTable({
    Key key,
    this.nutritionalInformations,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: {
        0: FlexColumnWidth(1.0),
        1: IntrinsicColumnWidth(),
        2: IntrinsicColumnWidth(),
        3: FlexColumnWidth(1.0),
      },
      children: <TableRow>[
        _createTableHeader(),
      ]..addAll(
          nutritionalInformations
              .map(
                (e) => _createTableItem(),
              )
              .toList(),
        ),
    );
  }

  TableRow _createTableHeader() {
    return TableRow(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black26,
            width: 2,
          ),
        ),
      ),
      children: [
        TableCell(
          child: Padding(
            padding: _tableRowPadding,
            child: Text(
              'Nutriente',
              style: _tableRowTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        TableCell(
          child: Padding(
            padding: _tableRowPadding,
            child: Text(
              'Cant.',
              style: _tableRowTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        TableCell(
          child: Padding(
            padding: _tableRowPadding,
            child: Text(
              'Unid.',
              style: _tableRowTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        TableCell(
          child: Padding(
            padding: _tableRowPadding,
            child: Text(
              'Acción',
              style: _tableRowTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  TableRow _createTableItem() {
    return TableRow(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black26,
            width: 0.7,
          ),
        ),
      ),
      children: [
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Padding(
            padding: _tableRowPadding,
            child: Text(
              'Calcio',
              style: _tableRowTextStyle,
            ),
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Padding(
            padding: _tableRowPadding,
            child: Text(
              '15',
              style: _tableRowTextStyle,
              textAlign: TextAlign.end,
            ),
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Padding(
            padding: _tableRowPadding,
            child: Text(
              'gr',
              style: _tableRowTextStyle,
              textAlign: TextAlign.end,
            ),
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Padding(
            padding: _tableRowPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Icons.edit,
                    color: CustomColors.yellow,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
