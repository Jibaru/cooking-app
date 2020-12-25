import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/user/user_bloc.dart';
import '../../../models/user.dart';
import '../../mixins/pick_image_mixin.dart';
import '../../utils/custom_colors.dart';
import '../../utils/regex_validator.dart';
import '../../widgets/widgets.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FocusNode _screenFocusNode = FocusNode();
  final FocusNode _firstNameFocusNode = FocusNode();
  final FocusNode _lastNameFocusNode = FocusNode();
  final FocusNode _nickNameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final TextEditingController _firstNameTextEditingController =
      TextEditingController();
  final TextEditingController _lastNameTextEditingController =
      TextEditingController();
  final TextEditingController _nickNameTextEditingController =
      TextEditingController();
  final TextEditingController _emailTextEditingController =
      TextEditingController();

  bool _formHasChanged = false;

  @override
  void initState() {
    if (BlocProvider.of<UserBloc>(context).state is UserLoaded) {
      final UserLoaded state =
          BlocProvider.of<UserBloc>(context).state as UserLoaded;

      _firstNameTextEditingController.text = state.user.firstName;
      _lastNameTextEditingController.text = state.user.lastName;
      _nickNameTextEditingController.text = state.user.nickName;
      _emailTextEditingController.text = state.user.email;
    }
    super.initState();
  }

  @override
  void dispose() {
    _firstNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    _nickNameFocusNode.dispose();
    _emailFocusNode.dispose();
    _screenFocusNode.dispose();
    _firstNameTextEditingController.dispose();
    _lastNameTextEditingController.dispose();
    _nickNameTextEditingController.dispose();
    _emailTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_screenFocusNode),
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          color: Colors.white,
          child: SafeArea(
            child: BlocListener<UserBloc, UserState>(
              listener: (context, state) {
                if (state is UserUpdateSuccess) {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.black,
                      content: Text(state.message),
                      duration: Duration(milliseconds: 1000),
                    ),
                  );
                  BlocProvider.of<UserBloc>(context).add(UserLogIn());
                }
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      constraints: BoxConstraints(maxHeight: 350.0),
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 1.5,
                            spreadRadius: 1.5,
                            offset: Offset(0.0, 1.0),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topLeft,
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.black38,
                              ),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ),
                          UserAvatar(
                            size: 150.0,
                          ),
                          BlocBuilder<UserBloc, UserState>(
                            builder: (context, state) {
                              return Text(
                                (() {
                                  if (state is UserLoaded) {
                                    return state.user.fullName;
                                  } else if (state is UserUpdateSuccess) {
                                    return state.user.fullName;
                                  }

                                  return 'Usuario no cargado';
                                })(),
                                maxLines: 2,
                                overflow: TextOverflow.visible,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: 'ReemKufi',
                                  fontSize: 17,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child:
                          NotificationListener<OverscrollIndicatorNotification>(
                        onNotification:
                            (OverscrollIndicatorNotification overscroll) {
                          overscroll.disallowGlow();
                          return;
                        },
                        child: SingleChildScrollView(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 10.0,
                            ),
                            constraints: BoxConstraints(
                              minWidth: 180.0,
                              maxWidth: 320.0,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Form(
                                  onChanged: () => _onChangedForm(context),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      AppTextFormField(
                                        controller:
                                            _firstNameTextEditingController,
                                        focusNode: _firstNameFocusNode,
                                        labelText: 'Nombres',
                                        prefixIconData: Icons.person,
                                        keyboardType: TextInputType.name,
                                        textInputAction: TextInputAction.next,
                                        validator: (firstName) {
                                          if (firstName.isEmpty) {
                                            return 'Por favor ingrese un nombre';
                                          }
                                          return null;
                                        },
                                        onEditingComplete: () =>
                                            _lastNameFocusNode.requestFocus(),
                                      ),
                                      AppTextFormField(
                                        controller:
                                            _lastNameTextEditingController,
                                        focusNode: _lastNameFocusNode,
                                        labelText: 'Apellidos',
                                        prefixIconData: Icons.text_fields,
                                        keyboardType: TextInputType.name,
                                        textInputAction: TextInputAction.next,
                                        validator: (lastName) {
                                          if (lastName.isEmpty) {
                                            return 'Por favor ingrese un apellido';
                                          }
                                          return null;
                                        },
                                        onEditingComplete: () =>
                                            _nickNameFocusNode.requestFocus(),
                                      ),
                                      AppTextFormField(
                                        controller:
                                            _nickNameTextEditingController,
                                        focusNode: _nickNameFocusNode,
                                        labelText: 'Nickname',
                                        prefixIconData: Icons.person_outline,
                                        keyboardType: TextInputType.name,
                                        textInputAction: TextInputAction.next,
                                        validator: (nickName) {
                                          if (nickName.isEmpty) {
                                            return 'Por favor ingrese un nickname';
                                          }
                                          return null;
                                        },
                                        onEditingComplete: () =>
                                            _emailFocusNode.requestFocus(),
                                      ),
                                      AppTextFormField(
                                        controller: _emailTextEditingController,
                                        focusNode: _emailFocusNode,
                                        labelText: 'Correo Electrónico',
                                        prefixIconData: Icons.email,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        textInputAction: TextInputAction.done,
                                        validator: (email) {
                                          if (email.isEmpty) {
                                            return 'Por favor ingrese un email';
                                          } else if (RegexValidation
                                              .isInvalidEmail(email)) {
                                            return 'Correo electrónico inválido';
                                          }
                                          return null;
                                        },
                                        onEditingComplete: () =>
                                            FocusScope.of(context)
                                                .requestFocus(_screenFocusNode),
                                      ),
                                      SizedBox(
                                        height: 15.0,
                                      ),
                                      BlocBuilder<UserBloc, UserState>(
                                        builder: (context, state) {
                                          if (state is UserUpdateLoading) {
                                            return CircularProgressIndicator();
                                          }

                                          return AppRaisedButton(
                                            text: 'Guardar',
                                            onPressed: _formHasChanged
                                                ? () =>
                                                    _updateUser(context, state)
                                                : null,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: Colors.black26,
                                  height: 40.0,
                                ),
                                ProfileOption(
                                  title: 'Cambiar Contraseña',
                                  iconData: Icons.lock,
                                  // TODO: Handle modal to change password
                                  onTap: () {},
                                ),
                                ProfileOption(
                                  title: 'Mis Recetas',
                                  iconData: Icons.library_books,
                                  // TODO: Redirect to MyRecipes Screen
                                  onTap: () {},
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onChangedForm(BuildContext context) {
    final user = (BlocProvider.of<UserBloc>(context).state as UserLoaded).user;

    if (_firstNameTextEditingController.text.trim() != user.firstName ||
        _lastNameTextEditingController.text.trim() != user.lastName ||
        _emailTextEditingController.text.trim() != user.email ||
        _nickNameTextEditingController.text.trim() != user.nickName)
      setState(() {
        _formHasChanged = true;
      });
    else
      setState(() {
        _formHasChanged = false;
      });
  }

  void _updateUser(BuildContext context, UserState state) {
    if (state is UserLoaded) {
      final User user = state.user;
      final Map<String, String> fields = {};

      if (_firstNameTextEditingController.text != user.firstName)
        fields["firstName"] = _firstNameTextEditingController.text;

      if (_lastNameTextEditingController.text != user.lastName)
        fields["lastName"] = _lastNameTextEditingController.text;

      if (_nickNameTextEditingController.text != user.nickName)
        fields["nickName"] = _nickNameTextEditingController.text;

      if (_emailTextEditingController.text != user.email)
        fields["email"] = _emailTextEditingController.text;

      if (fields.isNotEmpty) {
        BlocProvider.of<UserBloc>(context).add(
          UserUpdated(
            fields: fields,
          ),
        );
      }
    }
  }
}

/// Provides a [Card] with a title, icon and action
class ProfileOption extends StatelessWidget {
  final String title;
  final IconData iconData;
  final VoidCallback onTap;

  const ProfileOption({
    Key key,
    @required this.title,
    this.iconData,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            color: Colors.black54,
            fontFamily: 'ReemKufi',
          ),
        ),
        leading: Icon(
          iconData,
          color: CustomColors.blue,
        ),
        trailing: Icon(Icons.arrow_right),
        onTap: onTap,
      ),
    );
  }
}

/// [UserAvatar] creates a image widget widget the capacity of
/// update an image from user and display changes applied
class UserAvatar extends StatefulWidget {
  final double size;

  UserAvatar({
    Key key,
    @required this.size,
  })  : assert(size >= 100.0),
        super(key: key);

  @override
  _UserAvatarState createState() => _UserAvatarState();
}

class _UserAvatarState extends State<UserAvatar> with PickImageMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      child: Stack(
        children: <Widget>[
          Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(widget.size / 2),
              border: Border.all(
                color: Colors.black12,
                width: 1.0,
              ),
            ),
            alignment: Alignment.center,
            child: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserLoaded) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(widget.size / 2),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              MemoryImage(state.user?.image?.uint8listBase64),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                } else if (state is UserUpdateProfileImageLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return Text(
                  'Sin imagen',
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    color: Colors.black26,
                    fontFamily: 'ReemKufi',
                    fontSize: 16,
                    letterSpacing: 0.4,
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                return FloatingActionButton(
                  mini: widget.size <= 100,
                  backgroundColor: 
                    (state is UserUpdateProfileImageLoading || 
                     state is UserUpdateLoading) 
                      ? Colors.grey 
                      : CustomColors.blue,
                  elevation: 2.0,
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                  ),
                  onPressed: 
                    (state is UserUpdateProfileImageLoading || 
                     state is UserUpdateLoading) 
                      ? null 
                      : () => showImagePickerBottomSheet(context),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void onImagePicked(File file) {
    BlocProvider.of<UserBloc>(context)
        .add(UserImageProfileUpdated(imageFile: file));
  }
}
