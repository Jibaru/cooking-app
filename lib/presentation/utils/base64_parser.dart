import 'dart:io';
import 'dart:convert';

import 'dart:typed_data';

File base64ToFile(String base64) {
  final decodedBytes = base64Decode(base64);
  return File.fromRawPath(decodedBytes);
}

Uint8List base64ToUint8List(String base64) => base64Decode(base64);

Uint8List fileToUint8List(File file) => file.readAsBytesSync();

String fileToBase64(File file) {
  final bytes = file.readAsBytesSync();
  return base64Encode(bytes);
}
