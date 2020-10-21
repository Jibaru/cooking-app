import 'package:cooking_app/utilities/custom_colors.dart';
import 'package:cooking_app/widgets/natural_number_select_button.dart';
import 'package:flutter/material.dart';

class AppTimeSelect extends StatefulWidget {
  final String label;
  final Duration initialTime;
  final void Function(Duration) onChanged;

  AppTimeSelect({
    Key key,
    @required this.label,
    this.onChanged,
    this.initialTime = const Duration(milliseconds: 0),
  }) : super(key: key);

  @override
  _AppTimeSelectState createState() => _AppTimeSelectState();
}

class _AppTimeSelectState extends State<AppTimeSelect> {
  Duration _currentTime;

  @override
  void initState() {
    _currentTime = widget.initialTime != null ? widget.initialTime : Duration();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showTimeSelect(context).then((a) {
          widget.onChanged?.call(_currentTime);
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black45,
              width: 1,
            ),
          ),
        ),
        child: Column(
          children: <Widget>[
            Text(
              widget.label,
              style: TextStyle(
                color: CustomColors.blue,
                fontFamily: 'ReemKufi',
                fontSize: 15,
              ),
            ),
            Text(
              '${_toStringDuration(_currentTime)}',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontFamily: 'ReemKufi',
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _toStringDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes";
  }

  Future<void> _showTimeSelect(BuildContext context) {
    Duration hours = Duration(hours: _currentTime.inHours);
    Duration minutes = Duration(minutes: _currentTime.inMinutes.remainder(60));

    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Establezca el tiempo',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                  fontFamily: 'ReemKufi',
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  NaturalNumberSelectButton(
                    initialNumber: _currentTime.inHours,
                    onChange: (value) {
                      setState(() {
                        hours = Duration(hours: value);
                        _currentTime = hours + minutes;
                      });
                    },
                  ),
                  SizedBox(
                    width: 10,
                    child: Text(
                      ':',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  NaturalNumberSelectButton(
                    initialNumber: _currentTime.inMinutes.remainder(60),
                    onChange: (value) {
                      setState(() {
                        minutes = Duration(minutes: value);
                        _currentTime = hours + minutes;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
