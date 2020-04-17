import 'package:flutter/material.dart';

typedef VoidCallback = void Function();
typedef SelectedOptionCallback = void Function(String);

class RecipeFilterBar extends StatefulWidget {

  final List<String> options;
  final SelectedOptionCallback onTap;

  RecipeFilterBar({
    @required this.options,
    this.onTap
  }): assert(options != null);

  @override
  _RecipeFilterBarState createState() => _RecipeFilterBarState();
}

class _RecipeFilterBarState extends State<RecipeFilterBar> {

  int _selectedOption;

  @override
  void initState() {
    super.initState();
    _selectedOption = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: widget.options.map(
            (option){

              int currentIndex = widget.options.indexOf(option);

              return RecipeFilterOption(
                text: option,
                onTap: (){
                  setState(() {
                    _selectedOption = currentIndex;
                  });
                  widget.onTap?.call(option);
                },
                selected: _selectedOption == currentIndex,
              );
            }
          ).toList(),
        ),
      ),
    );
  }
}

class RecipeFilterOption extends StatelessWidget {

  final String text;
  final bool selected;
  final VoidCallback onTap;

  RecipeFilterOption({
    @required this.text,
    this.onTap,
    this.selected = false,
  }) : assert(text != null);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: selected 
              ? FontWeight.bold : FontWeight.normal
          )
        ),
      ),
    );
  }
}