import 'package:flutter/material.dart';

import 'package:cooking_app/widgets/app_text_form_field.dart';

class AppTextFieldDialog extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData suffixIconData;
  final IconData prefixIconData;
  final FocusNode focusNode;
  final VoidCallback onEditingComplete;
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String> validator;
  final Widget Function(BuildContext) builder;

  const AppTextFieldDialog({
    Key key,
    this.controller,
    this.labelText,
    this.suffixIconData,
    this.prefixIconData,
    this.focusNode,
    this.onEditingComplete,
    this.onChanged,
    this.validator,
    @required this.builder,
  }) : super(key: key);

  @override
  _AppTextFieldDialogState createState() => _AppTextFieldDialogState();
}

class _AppTextFieldDialogState extends State<AppTextFieldDialog> {
  bool _isDialogOpen = false;

  @override
  void initState() {
    widget.focusNode?.addListener(() {
      if (widget.focusNode.hasFocus) {
        if (!_isDialogOpen) {
          _showDialog(context);
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
                  ? () => _showDialog(context)
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

  void _showDialog(BuildContext context) {
    Future.delayed(Duration(milliseconds: 100)).then(
      (_) {
        _isDialogOpen = true;
        showDialog(
          context: context,
          builder: widget.builder,
        ).then((_) {
          FocusScope.of(context).requestFocus(FocusNode());
          _isDialogOpen = false;
        });
      },
    );
  }
}
