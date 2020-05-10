import 'package:cooking_app/utilities/custom_colors.dart';
import 'package:flutter/material.dart';

typedef VoidCallback = void Function();

class ListOption extends StatelessWidget {

  final BorderRadius _borderRadius = const BorderRadius.all(Radius.circular(15));
  final IconData iconData;
  final String title;
  final VoidCallback onTap;

  const ListOption({
    Key key,
    @required this.iconData,
    @required this.title,
    this.onTap,
  }) : assert(iconData != null),
       assert(title != null),
       super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
      borderRadius: _borderRadius,
      child: Ink(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10
        ),
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: _borderRadius,
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              color: Colors.black12,
              offset: Offset(-1.0, -1.0)
            )
          ],
        ),
        child: Row(
          children: <Widget>[
            _icon(iconData),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 15
                ),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54
                  ),
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 25,
              color: CustomColors.yellow,
            )
          ],
        ),
      ),
    );
  }

  Widget _icon(icon){
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: CustomColors.yellow
      ),
      child: Icon(
        icon,
        size: 25,
        color: Colors.white,
      ),
    );
  }
}