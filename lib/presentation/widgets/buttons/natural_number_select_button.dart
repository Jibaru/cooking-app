import 'package:flutter/material.dart';

import '../../utils/custom_colors.dart';

typedef void NaturalNumberSelectedCallback(int value);

class NaturalNumberSelectButton extends StatefulWidget {
  final int initialNumber;
  final NaturalNumberSelectedCallback onChange;
  final int min;
  final int max;

  const NaturalNumberSelectButton({
    Key key,
    this.onChange,
    this.initialNumber = 0,
    this.min = 0,
    this.max = 99,
  })  : assert(min >= 0),
        assert(max <= 99),
        assert(initialNumber >= min && initialNumber <= max),
        super(key: key);

  @override
  _NaturalNumberSelectButtonState createState() =>
      _NaturalNumberSelectButtonState();
}

class _NaturalNumberSelectButtonState extends State<NaturalNumberSelectButton> {
  int _currentNumber;

  @override
  void initState() {
    _currentNumber = widget.initialNumber;
    super.initState();
  }

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
            if (_currentNumber + 1 <= widget.max) {
              setState(() {
                _currentNumber++;
              });
              widget.onChange?.call(_currentNumber);
            }
          },
        ),
        Text(
          '${_displayCurrentNumber()}',
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
            if (_currentNumber - 1 >= widget.min) {
              setState(() {
                _currentNumber--;
              });
              widget.onChange?.call(_currentNumber);
            }
          },
        ),
      ],
    );
  }

  String _displayCurrentNumber() {
    return (_currentNumber < 10) ? '0$_currentNumber' : '$_currentNumber';
  }
}
