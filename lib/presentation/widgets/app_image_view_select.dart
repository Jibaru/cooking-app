import 'dart:io';

import 'package:flutter/material.dart';

import '../mixins/pick_image_mixin.dart';

class AppImageViewSelect extends StatefulWidget {
  final void Function(File) onImagePicked;
  const AppImageViewSelect({
    Key key,
    this.onImagePicked,
  }) : super(key: key);

  @override
  _AppImageViewSelectState createState() => _AppImageViewSelectState();
}

class _AppImageViewSelectState extends State<AppImageViewSelect>
    with PickImageMixin, AutomaticKeepAliveClientMixin {
  File _imageFile;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GestureDetector(
      onTap: () {
        showImagePickerBottomSheet(context);
      },
      child: Container(
        height: 200.0,
        width: MediaQuery.of(context).size.width,
        color: Colors.black12,
        child: (_imageFile != null)
            ? Image.file(
                _imageFile,
                fit: BoxFit.cover,
              )
            : Center(
                child: Text(
                  'Sin Imagen',
                  style: TextStyle(
                    color: Colors.black45,
                    fontFamily: 'ReemKufi',
                    fontSize: 15,
                  ),
                ),
              ),
      ),
    );
  }

  @override
  void onImagePicked(File file) {
    setState(() {
      _imageFile = file;
    });
    widget.onImagePicked?.call(file);
  }

  @override
  bool get wantKeepAlive => true;
}
