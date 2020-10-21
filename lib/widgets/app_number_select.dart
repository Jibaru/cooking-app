import 'package:cooking_app/widgets/app_text_form_field.dart';
import 'package:cooking_app/widgets/natural_number_select_button.dart';
import 'package:flutter/material.dart';

class AppNumberSelect extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData suffixIconData;
  final IconData prefixIconData;
  final FocusNode focusNode;
  final VoidCallback onEditingComplete;
  final ValueChanged<String> onChanged;
  final Widget Function(BuildContext) builder;

  const AppNumberSelect({
    Key key,
    this.controller,
    this.labelText,
    this.suffixIconData,
    this.prefixIconData,
    this.focusNode,
    this.onEditingComplete,
    this.onChanged,
    this.builder,
  }) : super(key: key);

  @override
  _AppNumberSelectState createState() => _AppNumberSelectState();
}

class _AppNumberSelectState extends State<AppNumberSelect> {
  bool _isBottomSheetOpen = false;

  @override
  void initState() {
    widget.focusNode?.addListener(() {
      if (widget.focusNode.hasFocus) {
        if (!_isBottomSheetOpen) {
          _showBottomSheet(context);
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: AppTextFormField(
              controller: widget.controller,
              focusNode: widget.focusNode,
              labelText: widget.labelText,
              suffixIconData: widget.suffixIconData,
              prefixIconData: widget.prefixIconData,
              onChanged: widget.onChanged,
              onEditingComplete: widget.onEditingComplete,
              readOnly: true,
              onTap: (widget.focusNode == null)
                  ? () => _showBottomSheet(context)
                  : null,
            ),
          ),
          Visibility(
            visible: widget.controller?.text?.isNotEmpty,
            child: IconButton(
              icon: Icon(
                Icons.clear,
                color: Colors.red,
              ),
              onPressed: () {
                setState(() {
                  widget.controller?.text = '';
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(context) {
    Future.delayed(Duration(milliseconds: 100)).then(
      (_) {
        _isBottomSheetOpen = true;
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Establezca la cantidad',
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
                        initialNumber: 1,
                        min: 1,
                        max: 10,
                        onChange: (value) {
                          setState(() {
                            widget.controller?.text = '$value';
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ).then((_) {
          FocusScope.of(context).requestFocus(FocusNode());
          _isBottomSheetOpen = false;
        });
      },
    );
  }
}
