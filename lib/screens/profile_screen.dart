import 'dart:io';

import 'package:cooking_app/utilities/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FocusNode _screenFocusNode = FocusNode();

  @override
  void dispose() {
    _screenFocusNode.dispose();
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
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 0.0,
                  left: 0.0,
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    width: MediaQuery.of(context).size.width,
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
                        Text('Andres Calamaro Rodriguez')
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
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

class _UserAvatarState extends State<UserAvatar> {
  final ImagePicker _picker = ImagePicker();

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
                showModalBottomSheet(
                  context: context,
                  builder: _buildListSelection,
                  elevation: 1.5,
                );
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

  Widget _buildListSelection(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.camera_alt,
              color: CustomColors.blue,
            ),
            title: Text(
              'Cámara',
              style: TextStyle(
                color: Colors.black54,
                fontFamily: 'ReemKufi',
              ),
            ),
            trailing: Icon(
              Icons.arrow_right,
            ),
            onTap: () {
              Navigator.pop(context);
              _pickImage(ImageSource.camera).then((value) => null);
            },
          ),
          Divider(
            color: Colors.black12,
            indent: 15.0,
            endIndent: 15.0,
            height: 0.0,
          ),
          ListTile(
            leading: Icon(
              Icons.photo_library,
              color: CustomColors.blue,
            ),
            title: Text(
              'Galería',
              style: TextStyle(
                color: Colors.black54,
                fontFamily: 'ReemKufi',
              ),
            ),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.pop(context);
              _pickImage(ImageSource.gallery).then((value) => null);
            },
          ),
        ],
      ),
    );
  }

  /// Display a camera or gallery to pick an image
  /// Returns [true] if [_imageFile] is asigned with
  /// new value, and [false] if not an error ocurred
  /// The Error is visible on snackbar
  Future<bool> _pickImage(ImageSource source) async {
    try {
      final file = await _picker.getImage(
        source: source,
        preferredCameraDevice: CameraDevice.rear,
      );
      setState(() {
        if (file != null) {
          _pickedFile = File(file.path);
        }
      });
    } catch (e) {
      if (Scaffold.of(context) != null) {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('No se pudo cargar la imagen'),
          backgroundColor: Colors.black,
          duration: Duration(seconds: 2),
        ));
      }
    }
  }
}
