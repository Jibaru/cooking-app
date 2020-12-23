import 'dart:convert';
import 'dart:io';
import 'dart:typed_data' show Uint8List;

import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import '../presentation/utils/base64_parser.dart';

class Image extends Equatable {
  final int id;
  final String name;
  final String mimeType;
  final String base64;

  const Image({
    @required this.id,
    @required this.name,
    @required this.mimeType,
    @required this.base64,
  });

  @override
  List<Object> get props => [id, name, mimeType, base64];

  Uint8List get uint8listBase64 => base64ToUint8List(this.base64);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'mimeType': mimeType,
      'base64': base64,
    };
  }

  factory Image.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Image(
      id: map['id'],
      name: map['name'],
      mimeType: map['mimeType'],
      base64: map['base64'],
    );
  }

  factory Image.fromFile(File file) {
    if (file == null) return null;

    return Image(
      id: null,
      name: file.path.split('/').last,
      mimeType: file.path.split('.').last,
      base64: fileToBase64(file),
    );
  }

  String toJson() => json.encode(toMap());

  factory Image.fromJson(String source) => Image.fromMap(json.decode(source));
}
