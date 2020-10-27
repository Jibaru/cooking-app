import 'package:flutter/material.dart';

import '../utils/custom_colors.dart';

class ListSelectButton<T> extends StatefulWidget {
  final List<T> list;
  final void Function(T) onChange;

  ListSelectButton({
    Key key,
    @required this.list,
    this.onChange,
  }) : super(key: key);

  T unitAt(int i) => list[i];
  int unitsSize() => list.length;

  @override
  _ListSelectButton createState() => _ListSelectButton();
}

class _ListSelectButton<T> extends State<ListSelectButton<T>> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        FlatButton(
          color: CustomColors.blue,
          child: Icon(
            Icons.arrow_upward,
            color: Colors.white,
          ),
          onPressed: () {
            if (_currentIndex + 1 < widget.unitsSize()) {
              setState(() {
                _currentIndex++;
              });
              widget.onChange?.call(widget.unitAt(_currentIndex));
            }
          },
        ),
        Text(
          '${widget.unitAt(_currentIndex)}',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 25,
            fontFamily: 'ReemKufi',
          ),
        ),
        FlatButton(
          color: CustomColors.blue,
          child: Icon(
            Icons.arrow_downward,
            color: Colors.white,
          ),
          onPressed: () {
            if (_currentIndex - 1 >= 0) {
              setState(() {
                _currentIndex--;
              });
              widget.onChange?.call(widget.unitAt(_currentIndex));
            }
          },
        ),
      ],
    );
  }
}
