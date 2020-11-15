import 'dart:convert';
import 'dart:io';

import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class Image extends Equatable {
  final int id;
  final String name;
  final String mimeType;
  final File file;

  const Image({
    @required this.id,
    @required this.name,
    @required this.mimeType,
    @required this.file,
  });

  @override
  List<Object> get props => [id, name, mimeType, base64Url];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'mimeType': mimeType,
      'base64': _fileToBase64(file),
    };
  }

  factory Image.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Image(
      id: map['id'],
      name: map['name'],
      mimeType: map['mimeType'],
      file: map['base64'] != null
          ? _base64ToFile(map['name'], map['base64'])
          : null,
    );
  }

  factory Image.fromFile(File file) {
    if (file == null) return null;

    return Image(
      id: null,
      name: file.path.split('/').last,
      mimeType: file.path.split('.').last,
      file: file,
    );
  }

  String toJson() => json.encode(toMap());

  factory Image.fromJson(String source) => Image.fromMap(json.decode(source));

  static File _base64ToFile(String name, String source) {
    final decodedBytes = base64Decode(source);
    var file = File(name);
    file.writeAsBytesSync(decodedBytes);

    return file;
  }

  static String _fileToBase64(File file) {
    final bytes = file.readAsBytesSync();
    String img64 = base64Encode(bytes);
    return img64;
  }
}
