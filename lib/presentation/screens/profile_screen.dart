import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../mixins/pick_image_mixin.dart';
import '../utils/custom_colors.dart';
import '../utils/regex_validator.dart';
import '../widgets/widgets.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FocusNode _screenFocusNode = FocusNode();
  final FocusNode _firstNameFocusNode = FocusNode();
  final FocusNode _lastNameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final TextEditingController _firstNameTextEditingController =
      TextEditingController();
  final TextEditingController _lastNameTextEditingController =
      TextEditingController();
  final TextEditingController _emailTextEditingController =
      TextEditingController();

  bool _formHasChanged = false;

  @override
  void initState() {
    // TODO: change to the current logged in user data
    _firstNameTextEditingController.text = 'Ignacio Raúl';
    _lastNameTextEditingController.text = 'Rueda Boada';
    _emailTextEditingController.text = 'ignacioruedaboada@gmail.com';
    super.initState();
  }

  @override
  void dispose() {
    _firstNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    _emailFocusNode.dispose();
    _screenFocusNode.dispose();
    _firstNameTextEditingController.dispose();
    _lastNameTextEditingController.dispose();
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
                          urlImage:
                              'https://assets.nacionrex.com/__export/1582590075513/sites/debate/img/2020/02/24/69ec52ac01bd9e7c316b91bd4c3aa2ed_crop1582590058186.jpg_1577178466.jpg',
                        ),
                        Text(
                          'Andres Calamaro Rodriguez',
                          maxLines: 2,
                          overflow: TextOverflow.visible,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black54,
                            fontFamily: 'ReemKufi',
                            fontSize: 17,
                          ),
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
                                // FIXME: Detect if a new input is equals to old value
                                onChanged: () =>
                                    setState(() => _formHasChanged = true),
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
                                          _emailFocusNode.requestFocus(),
                                    ),
                                    AppTextFormField(
                                      controller: _emailTextEditingController,
                                      focusNode: _emailFocusNode,
                                      labelText: 'Correo Electrónico',
                                      prefixIconData: Icons.email,
                                      keyboardType: TextInputType.emailAddress,
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
                                    AppRaisedButton(
                                      text: 'Guardar',
                                      onPressed: _formHasChanged
                                          ? () {
                                              // TODO: Change data with service
                                            }
                                          : null,
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
    );
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
  final String urlImage;
  final File fileImage;

  UserAvatar({
    Key key,
    @required this.size,
    this.urlImage,
    this.fileImage,
  })  : assert(size >= 100.0),
        assert((urlImage != null && fileImage == null) ||
            (urlImage == null && fileImage != null)),
        super(key: key);

  @override
  _UserAvatarState createState() => _UserAvatarState();
}

class _UserAvatarState extends State<UserAvatar> with PickImageMixin {
  File _pickedFile;

  @override
  void initState() {
    // FIXME: Reference to a final instance of file
    if (widget.fileImage != null) _pickedFile = widget.fileImage;
    super.initState();
  }

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
              //image: _getImage(),
            ),
            alignment: Alignment.center,
            child: (_pickedFile == null && widget.urlImage == null)
                ? Text(
                    'Sin imagen',
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      color: Colors.black26,
                      fontFamily: 'ReemKufi',
                      fontSize: 16,
                      letterSpacing: 0.4,
                    ),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(widget.size / 2),
                    child: _getImage(),
                  ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              mini: widget.size <= 100,
              backgroundColor: CustomColors.blue,
              elevation: 2.0,
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
              onPressed: () {
                // TODO: Handle image
                showImagePickerBottomSheet(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _getImage() {
    // On first load widget
    if (widget.urlImage != null && _pickedFile == null) {
      return FadeInImage.assetNetwork(
        placeholder: 'assets/img/img_loader.gif',
        placeholderScale: 0.5,
        image: widget.urlImage,
        fit: BoxFit.cover,
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: FileImage(_pickedFile),
            fit: BoxFit.cover,
          ),
        ),
      );
    }
  }

  @override
  void onImagePicked(File file) {
    setState(() {
      _pickedFile = File(file.path);
    });
  }
}
