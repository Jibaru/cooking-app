import 'package:flutter/material.dart';

import '../../../../widgets/widgets.dart';

class RecipeCuisineSelectDialog extends StatefulWidget {
  final void Function(String) onSelect;

  const RecipeCuisineSelectDialog({
    Key key,
    this.onSelect,
  }) : super(key: key);

  @override
  _RecipeCusineSelectDialogState createState() =>
      _RecipeCusineSelectDialogState();
}

class _RecipeCusineSelectDialogState extends State<RecipeCuisineSelectDialog> {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: const EdgeInsets.all(20.0),
      children: <Widget>[
        Text(
          'Tipo de cocina',
          style: TextStyle(
            fontFamily: 'ReemKufi',
            color: Colors.black54,
            fontSize: 15,
          ),
        ),
        AppTextFormField(
          prefixIconData: Icons.search,
        ),
        Container(
          height: 300.0,
          margin: const EdgeInsets.only(top: 10.0),
          width: double.maxFinite,
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowGlow();
              return;
            },
            child: ListView.builder(
              itemCount: 25,
              padding: EdgeInsets.zero,
              itemBuilder: (context, i) {
                return ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  leading: Icon(Icons.indeterminate_check_box),
                  title: Text(
                    'Americana $i',
                    style: TextStyle(
                      fontFamily: 'ReemKufi',
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {
                    widget.onSelect?.call('Americana $i');
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
