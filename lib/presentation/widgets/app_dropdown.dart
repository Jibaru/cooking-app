import 'package:flutter/material.dart';

import '../utils/custom_colors.dart';

class AppDropdown extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData suffixIconData;
  final List<String> list;
  final ValueChanged<String> onChanged;

  const AppDropdown({
    Key key,
    this.controller,
    this.labelText,
    this.onChanged,
    @required this.list,
    this.suffixIconData = Icons.arrow_drop_down,
  }) : super(key: key);

  @override
  _AppDropdownState createState() => _AppDropdownState();
}

class _AppDropdownState extends State<AppDropdown> {
  String _dropdownValue;

  @override
  void initState() {
    _dropdownValue = widget.list.first;
    widget.controller?.text = _dropdownValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: 12.0,
        ),
        Text(
          widget.labelText,
          style: TextStyle(
            fontFamily: 'ReemKufi',
            fontSize: 12,
            color: Colors.black54,
          ),
        ),
        DropdownButton<String>(
          value: _dropdownValue,
          icon: Icon(
            widget.suffixIconData,
            color: CustomColors.blue,
          ),
          iconSize: 24,
          style: TextStyle(
            fontFamily: 'ReemKufi',
            color: Colors.black54,
            fontSize: 18,
          ),
          underline: SizedBox.shrink(),
          onChanged: (newValue) {
            setState(() {
              _dropdownValue = newValue;
            });
            widget.onChanged?.call(newValue);
            widget.controller?.text = newValue;
          },
          isDense: true,
          isExpanded: true,
          items: widget.list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        Container(
          margin: const EdgeInsets.only(top: 12.0),
          height: 1.0,
          color: Colors.black45,
        ),
      ],
    );
  }
}
