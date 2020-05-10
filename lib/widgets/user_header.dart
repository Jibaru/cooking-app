import 'package:animate_do/animate_do.dart';
import 'package:cooking_app/utilities/custom_colors.dart';
import 'package:flutter/material.dart';

class UserHeader extends StatelessWidget {
  
  final double width;
  final double height;
  final double avatarRadius;
  final ImageProvider backgroundImage;

  final double _headerOptionshorizontalPadding = 10.0;
  final TextStyle _profileStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    shadows: [
      BoxShadow(
        blurRadius: 2,
        color: Colors.black,
        offset: Offset(0.0, 1.0)
      )
    ]
  );

  const UserHeader({
    Key key,
    this.width,
    this.height,
    @required this.avatarRadius,
    @required this.backgroundImage
  }) : assert(avatarRadius != null),
       assert(backgroundImage != null),
       super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.symmetric(
        horizontal: _headerOptionshorizontalPadding,
        vertical: 15.0
      ),
      decoration: BoxDecoration(
        color: CustomColors.yellow50,
        image: DecorationImage(
          image: backgroundImage,
          fit: BoxFit.cover
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            color: Colors.black12,
            offset: Offset(0.0, 1.0)
          )
        ]
      ),
      child: Column(
        children: <Widget>[
          _headerOptions(context),
          BounceInDown(
            child: CircleAvatar(
              radius: avatarRadius,
              backgroundImage: NetworkImage('https://images.vexels.com/media/users/3/145908/preview2/52eabf633ca6414e60a7677b0b917d92-creador-de-avatar-masculino.jpg'),
            ),
          ),
          Text(
            'username',
            style: _profileStyle.copyWith(
              fontSize: 25
            ),
          ),
          Text(
            'email',
            style: _profileStyle.copyWith(
              fontSize: 15,
            )
          )
        ],
      ),
    );
  }

  Widget _headerOptions(context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _customSizedBox(context),
        _customSizedBox(
          context, 
          Text(
            'Profile',
            style: _profileStyle,
          ), 
        ),
        _customSizedBox(
          context, 
          _editButton(
            onPressed: () => {}
          )
        )
      ],
    );
  }

  Widget _customSizedBox(context, [Widget child]){
    return Container(
      width: (MediaQuery.of(context).size.width * 0.33) - _headerOptionshorizontalPadding,
      alignment: Alignment.center,
      child: child,
    );
  }

  Widget _editButton({Function onPressed}){
    return RawMaterialButton(
      onPressed: onPressed,
      splashColor: Colors.white10,
      fillColor: CustomColors.yellow,
      shape: const StadiumBorder(),
      child: Icon(Icons.edit, color: Colors.white,)
    );
  }
}