import 'package:flutter/material.dart';

import '../../../../utils/custom_colors.dart';
import '../../../../widgets/widgets.dart';

class RecipeTagCreateDialog extends StatefulWidget {
  final Set<String> initialTags;
  final void Function(String) onTagAdded;
  final void Function(String) onTagDeleted;

  const RecipeTagCreateDialog({
    Key key,
    this.initialTags,
    this.onTagAdded,
    this.onTagDeleted,
  }) : super(key: key);

  @override
  _RecipeTagCreateDialogState createState() => _RecipeTagCreateDialogState();
}

class _RecipeTagCreateDialogState extends State<RecipeTagCreateDialog> {
  final TextEditingController _nameTagTextEditingController =
      TextEditingController();
  final Set<String> _currentTags = <String>{};

  @override
  void initState() {
    if (widget.initialTags != null) {
      _currentTags.addAll(widget.initialTags);
    }
    super.initState();
  }

  @override
  void dispose() {
    _nameTagTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: const EdgeInsets.all(20.0),
      children: <Widget>[
        Text(
          'Tags',
          style: TextStyle(
            fontFamily: 'ReemKufi',
            color: Colors.black54,
            fontSize: 15,
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: AppTextFormField(
                controller: _nameTagTextEditingController,
                labelText: 'Nombre del Tag',
                prefixIconData: Icons.tag_faces,
              ),
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  _currentTags.add(_nameTagTextEditingController.text);
                });
                widget.onTagAdded?.call(_nameTagTextEditingController.text);
              },
            ),
          ],
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
            child: SingleChildScrollView(
              child: Wrap(
                spacing: 10.0,
                children: _currentTags
                    .toList()
                    .reversed
                    .map(
                      (tagItem) => Chip(
                        label: Text('$tagItem'),
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontFamily: 'ReemKufi',
                          fontSize: 15,
                        ),
                        deleteIcon: Icon(Icons.close),
                        deleteIconColor: Colors.white,
                        backgroundColor: CustomColors.yellow,
                        onDeleted: () {
                          setState(() {
                            _currentTags.remove(tagItem);
                          });
                          widget.onTagDeleted?.call(tagItem);
                        },
                      ),
                    )
                    .toList()
                    .cast<Widget>(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
