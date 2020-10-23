import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/custom_colors.dart';

mixin PickImageMixin {
  final ImagePicker _picker = ImagePicker();

  /// Called when image is selected
  /// [file] contains a file reference to
  /// image picked. [file] never is [null]
  void onImagePicked(File file);

  Future<void> showImagePickerBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => _buildListSelection(context),
      elevation: 1.5,
    );
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
              _pickImage(context, ImageSource.camera);
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
              _pickImage(context, ImageSource.gallery);
            },
          ),
        ],
      ),
    );
  }

  /// Display a camera or gallery to pick an image
  /// The Error is visible on snackbar
  Future _pickImage(BuildContext context, ImageSource source) async {
    try {
      final file = await _picker.getImage(
        source: source,
        preferredCameraDevice: CameraDevice.rear,
      );

      if (file != null) onImagePicked(File(file.path));
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
