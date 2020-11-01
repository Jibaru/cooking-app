import 'package:flutter/material.dart';

import '../../../../widgets/widgets.dart';

class RecipeTypeSelectDialog extends StatefulWidget {
  final void Function(String) onSelect;

  const RecipeTypeSelectDialog({
    Key key,
    this.onSelect,
  }) : super(key: key);

  @override
  _RecipeTypeSelectDialogState createState() => _RecipeTypeSelectDialogState();
}

class _RecipeTypeSelectDialogState extends State<RecipeTypeSelectDialog> {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: const EdgeInsets.all(20.0),
      children: <Widget>[
        Text(
          'Tipo de receta',
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
              itemCount: 10,
              padding: EdgeInsets.zero,
              itemBuilder: (context, i) {
                return ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  leading: Icon(Icons.indeterminate_check_box),
                  title: Text(
                    'Entrada $i',
                    style: TextStyle(
                      fontFamily: 'ReemKufi',
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {
                    widget.onSelect?.call('Entrada $i');
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
